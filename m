Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZ9bp-0002tC-5w
 for ath11k@lists.infradead.org; Fri, 07 Jun 2019 07:48:22 +0000
MIME-Version: 1.0
Date: Fri, 07 Jun 2019 13:18:19 +0530
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: Re: [PATCH] ath11k: Fix the rate mask value for legacy and peer fixed
 rate
In-Reply-To: <87imtit271.fsf@kamboji.qca.qualcomm.com>
References: <1559648239-16220-1-git-send-email-mkenna@codeaurora.org>
 <20190606165407.65AC460DAB@smtp.codeaurora.org>
 <04d8be7e61dad763b8526bf615af4730@codeaurora.org>
 <87imtit271.fsf@kamboji.qca.qualcomm.com>
Message-ID: <4e749c40cc8448aa2481fd1d52f5f716@codeaurora.org>
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
Cc: ath11k@lists.infradead.org

On 2019-06-07 10:35 am, Kalle Valo wrote:
> Maharaja Kennadyrajan <mkenna@codeaurora.org> writes:
> 
>> On 2019-06-06 10:24 pm, Kalle Valo wrote:
>>> Maharaja Kennadyrajan <mkenna@codeaurora.org> wrote:
>>> 
>>>> The rate mask value is changed from 0xff to oxffff (u8 to u32)
>>>> in the firmware for the legacy fixed rate and peer fixed rate
>>>> setting in the set bitrate command.
>>>> Hence this patch is fixing the same in the driver.
>>>> 
>>>> Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
>>> 
>>> Is this backwards compatible change? I'm not convinced about that.
>> 
>> [Maha]: It won't break the backward compatibility as firmware is
>> taking care of it. Firmware is using 0xffff as mask value from the
>> beginning and this change is not added recently in the firmware.
> 
> Good, thanks for the clarification.

[Maha]: Thanks, please apply this is patch in ath.git

-- 
Regards,
Maha

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
