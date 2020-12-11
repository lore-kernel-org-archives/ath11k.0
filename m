Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knbxZ-0007cd-Pp
 for ath11k@lists.infradead.org; Fri, 11 Dec 2020 06:31:23 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 5/6] ath11k: pci: disable VDD4BLOW
References: <1607609124-17250-1-git-send-email-kvalo@codeaurora.org>
 <1607609124-17250-6-git-send-email-kvalo@codeaurora.org>
 <d9b860d3-4ccc-f16c-9b0c-e0e7a0646e64@eero.com>
Date: Fri, 11 Dec 2020 08:31:16 +0200
In-Reply-To: <d9b860d3-4ccc-f16c-9b0c-e0e7a0646e64@eero.com> (Peter Oh's
 message of "Thu, 10 Dec 2020 14:04:43 -0800")
Message-ID: <87a6uk97m3.fsf@codeaurora.org>
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
To: Peter Oh <peter.oh@eero.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Peter Oh <peter.oh@eero.com> writes:

> On 12/10/20 6:05 AM, Kalle Valo wrote:
>> From: Carl Huang <cjhuang@codeaurora.org>
>>
>> It's recommended to disable VDD4BLOW during initialisation.
>
> Can you explain more about "recommended by whom and why"?

It's coming from the internal teams, I understood the internal driver
does the same.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
