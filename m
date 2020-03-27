Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHgfy-0008TT-LN
 for ath11k@lists.infradead.org; Fri, 27 Mar 2020 04:33:00 +0000
MIME-Version: 1.0
Date: Fri, 27 Mar 2020 10:02:54 +0530
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: Re: [PATCH] ath11k: add pktlog checksum in trace events to support
 pktlog
In-Reply-To: <87k137oykt.fsf@tynnyri.adurom.net>
References: <1585234155-30574-1-git-send-email-mkenna@codeaurora.org>
 <87k137oykt.fsf@tynnyri.adurom.net>
Message-ID: <24d78270e4df4a336e4b9989415af7e1@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On 2020-03-26 22:14, Kalle Valo wrote:
> Maharaja Kennadyrajan <mkenna@codeaurora.org> writes:
> 
>> Pktlog data are different among the chipset & chipset versions.
>> As part of enhancing the user space script to decode the pktlog
>> trace events generated, it is desirable to know which chipset or
>> which chipset version has provided the events and thereby decode
>> the pktlogs appropriately.
>> 
>> Pktlog checksum helps to determine the chipset variant which is
>> given by the firmware in the struct wmi_ready_event.
>> 
>> Pktlog checksums are computed during the firmware build.
>> So, adding that pktlog checksum in the pklog trace events.
>> 
>> Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
> 
> When you send a new version please always increase the version number
> (in this case this should be v2), even if just the email address has
> changed. That way I can immediately see which version to take.
> 
> But no need to resend just because of this.

[Maha]: Sure Kalle. Got it. Thanks for the clarification.

Regards,
Maha

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
