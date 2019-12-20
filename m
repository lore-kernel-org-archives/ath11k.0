Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iiJ7S-0005FO-E4
 for ath11k@lists.infradead.org; Fri, 20 Dec 2019 14:19:09 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH qca6390-bringup] ath11k: enable internal sleep clock
References: <1576812528-24979-1-git-send-email-cjhuang@codeaurora.org>
Date: Fri, 20 Dec 2019 16:18:59 +0200
In-Reply-To: <1576812528-24979-1-git-send-email-cjhuang@codeaurora.org> (Carl
 Huang's message of "Fri, 20 Dec 2019 11:28:48 +0800")
Message-ID: <87sglf13n0.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Carl Huang <cjhuang@codeaurora.org>
Cc: ath11k@lists.infradead.org

Carl Huang <cjhuang@codeaurora.org> writes:

> For QCA6390 on x86 and non-qcom platfrom, host need explicitly tell firmware
> to use internal sleep clock. Some QCA6390 modules have OTP burnt with external
> sleep clock selected, and these moduesl usually can't  work normally on
> these platforms unless firmware selects internal sleep clock.
>
> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>

I applied the 8 qca6390 patches you submitted to ath11k-qca6390-bringup
branch now.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
