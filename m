Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2XOx-0000jx-Si
 for ath11k@lists.infradead.org; Tue, 27 Aug 2019 09:04:34 +0000
MIME-Version: 1.0
Date: Tue, 27 Aug 2019 14:34:23 +0530
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: Re: [PATCH 10/49] ath11k: add debug.c
In-Reply-To: <4441194.D8eDD6Tzdi@bentobox>
References: <1566316095-27507-1-git-send-email-kvalo@codeaurora.org>
 <2708501.D2hezO5Rnt@bentobox>
 <80bdedf3740960e0ce05b02a77d1b457@codeaurora.org>
 <4441194.D8eDD6Tzdi@bentobox>
Message-ID: <6622b83f754404ec05b9442027757c5e@codeaurora.org>
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
To: Sven Eckelmann <sven@narfation.org>
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

On 2019-08-27 13:05, Sven Eckelmann wrote:
> On Tuesday, 27 August 2019 09:33:39 CEST Anilkumar Kolli wrote:
> [...]
>> >     [ 4312.884650] The reading for sensor 4 is 0x002041f7
>> >     [ 4312.891499] The reading for sensor 5 is 0x002051f4
>> >     [ 4312.896415] Couldn't get reading for sensor 6
>> >     [ 4312.901189] Couldn't get reading for sensor 7
>> >     [ 4312.905561] The reading for sensor 8 is 0x002081e0
>> >     [ 4312.909902] The reading for sensor 9 is 0x002091f7
>> >     [ 4312.914645] Couldn't get reading for sensor 10
>> >     [ 4312.919364] The reading for sensor 11 is 0x0020b1fa
>> >     [ 4312.923791] The reading for sensor 12 is 0x0020c1fa
>> >     [ 4312.928621] Couldn't get reading for sensor 13
>> >     [ 4312.933425] The reading for sensor 14 is 0x0020e1f4
>> >     [ 4312.937941] The reading for sensor 15 is 0x0020f1e7
>> >     [ 4313.942700] Rebooting in 3 seconds..
>> >
>> > Maybe can be fixed by a different kernel (for the remoteproc). But I
>> > don't
>> > have this kernel at the moment.
>> >
>> 
>> The write of an "assert", sends 'WMI_FORCE_FW_HANG_CMDID' WMI command 
>> to
>> target firmware.
>> This WMI command forces the target to assert.
> 
> Yes, but it shouldn't kill the complete system.
> 
This will not kill the whole system, This will crash target and we have 
mechanism to recover the system.

Hope u have generated the crash with below patch,
https://source.codeaurora.org/quic/qsdk/oss/system/feeds/wlan-open/tree/mac80211/patches/019-ath11k-disable-q6-recovery-to-crash-kernel.patch?h=win_ap.1.0

Please remove this patch to see the target recover after the crash.

Thanks
Anil


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
