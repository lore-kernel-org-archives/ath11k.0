Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZwMI-0005GL-Fo
 for ath11k@lists.infradead.org; Tue, 03 Nov 2020 13:28:23 +0000
MIME-Version: 1.0
Date: Tue, 03 Nov 2020 16:42:01 +0800
From: Carl Huang <cjhuang@codeaurora.org>
Subject: Re: PROBLEM: unable to get QCA6390 to work
In-Reply-To: <c9cc0ec6-4dda-2608-3575-0e6dfb6d0852@gmail.com>
References: <fa22cf0f-3bac-add6-8c71-6f6cad5206d8@gmail.com>
 <87lffjodu7.fsf@codeaurora.org>
 <fa338986-8de4-fde1-6805-d46793c947e4@gmail.com>
 <c9cc0ec6-4dda-2608-3575-0e6dfb6d0852@gmail.com>
Message-ID: <51201ba28aeccb57dabc5e72868a899f@codeaurora.org>
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
To: Pavel Procopiuc <pavel.procopiuc@gmail.com>
Cc: ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

On 2020-11-03 05:14, Pavel Procopiuc wrote:
> After doing some testing I was able to get it running under some
> specific conditions. I took the v5.9 tag of the main kernel tree and
> merged in the ath11k-qca6390-bringup-202009250825 tag from the ath
> tree. I had to fix some trivial conflicts, but the resulting kernel
> together with the firmware (amss.bin, m3.bin and board-2.bin) gave me
> a working driver that I was able to use to connect to my AP in both
> 2,4 and 5GHz.
> 
> I then tried to copy over the ath11k driver source resulting from that
> merge on top of the 5.10-rc2 tag. After fixing some API breakage
> (IEEE80211_TX_CTRL_HW_80211_ENCAP and ieee80211_set_hw_80211_encap) to
> make it compile I booted into the resulting kernel, but ath11k driver
> was giving me the same firmware errors I had initially on 5.10-rc2. So
> it looks like there might be some change in 5.10 that broke the logic.
> 
> Op 02.11.2020 om 19:21 schreef Pavel Procopiuc:
>> Ah, my bad, I've now renamed the board-2.bin file, the md5's match 
>> yours. But it doesn't seem to have a positive effect.

Please set ath11k.ko module parameter debug_mask to 0xffffffff, and then 
reproduce and share the log.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
