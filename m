Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-185.smtp-out.us-west-2.amazonses.com ([54.240.27.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGpSS-0006QE-Bg
 for ath11k@lists.infradead.org; Fri, 11 Sep 2020 20:15:45 +0000
MIME-Version: 1.0
Date: Fri, 11 Sep 2020 20:15:40 +0000
From: Aloka Dixit <alokad@codeaurora.org>
Subject: Re: [PATCH V6 2/2] ath11k: add support for setting fixed HE
 rate/gi/ltf
In-Reply-To: <010101746c53c3fc-6b47ad5d-f740-4029-9a89-2ba9bef427f3-000000@us-west-2.amazonses.com>
References: <20200804081630.2013619-2-john@phrozen.org>
 <010101746c53c3fc-6b47ad5d-f740-4029-9a89-2ba9bef427f3-000000@us-west-2.amazonses.com>
Message-ID: <010101747ecf2bf3-1c85fbd7-6959-48c5-a4cf-4579d8fbdd70-000000@us-west-2.amazonses.com>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Miles Hu <milehu@codeaurora.org>, linux-wireless@vger.kernel.org, linux-wireless-owner@vger.kernel.org, John Crispin <john@phrozen.org>, Johannes Berg <johannes@sipsolutions.net>, ath11k@lists.infradead.org

On 2020-09-07 23:07, Kalle Valo wrote:
> John Crispin <john@phrozen.org> wrote:
> 
>> From: Miles Hu <milehu@codeaurora.org>
>> 
>> This patch adds ath11k support for setting fixed HE rate/gi/ltf values 
>> that
>> we are now able to send to the kernel using nl80211. The added code is
>> reusing parts of the existing code path already used for HT/VHT. The 
>> new
>> helpers are symmetric to how we do it for HT/VHT.
>> 
>> Signed-off-by: Miles Hu <milehu@codeaurora.org>
>> Signed-off-by: John Crispin <john@phrozen.org>
> 
> Depends on:
> 
> eb89a6a6b7a1 nl80211: add support for setting fixed HE rate/gi/ltf
> 
> Currently in net-next.

Hi Kalle and John,
This patch includes auto-rate support as well which is part of the CAF 
changes John mentioned in v55 change-log.
Auto-rate part was added by me into CAF.
Please add my sign-off on this patch.
Or let me know if you decide to remove that particular portion, then I 
will send a separate patch.
Thanks.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
