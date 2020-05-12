Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYQDp-0000vG-QV
 for ath11k@lists.infradead.org; Tue, 12 May 2020 08:25:08 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 4/4] ath11k: Register mhi controller device for qca6390
References: <20200508085850.23363-1-govinds@codeaurora.org>
 <20200508085850.23363-5-govinds@codeaurora.org>
 <87d07a4acz.fsf@kamboji.qca.qualcomm.com>
 <20200512071323.GI4928@Mani-XPS-13-9360>
 <871rnp4lc7.fsf@kamboji.qca.qualcomm.com>
Date: Tue, 12 May 2020 11:24:50 +0300
In-Reply-To: <871rnp4lc7.fsf@kamboji.qca.qualcomm.com> (Kalle Valo's message
 of "Tue, 12 May 2020 11:19:04 +0300")
Message-ID: <87wo5h36i5.fsf@kamboji.qca.qualcomm.com>
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
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> writes:

>> But we have made few changes to the MHI stack which will impact the
>> controller drivers.
>
> Oh, that will create problems. What kind of changes are needed in
> ath11k?

I did a test of pulling
'git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-next' to
my pending branch and at least it compiled without issues. So hopefully
the changes in mhi-next won't break ath11k.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
