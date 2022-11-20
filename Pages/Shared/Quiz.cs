using Newtonsoft.Json;

namespace QuizApp.Pages.Shared
{
    public class Quiz
    {
        public string Name { get; set; }
        public List<Question> Questions { get; set; }
        public DateTime TimeOfCreation { get; }

        public Quiz(string name, List<Question> questions, DateTime timeOfCreation)
        {
            Name = name;
            Questions = questions;
            TimeOfCreation = timeOfCreation;
        }

        public string getQuestionsJson()
        {
            return JsonConvert.SerializeObject(Questions);
        }
        public void setQuestionJson(string json)
        {
            if(json == null)
            {
                return;
            }
            Questions = JsonConvert.DeserializeObject<List<Question>>(json);
        }
    }
    public class Question
    {
        public string QuestionText { get; set; }
        public List<Tuple<string, bool>> Answers { get; set; }
    }
}
