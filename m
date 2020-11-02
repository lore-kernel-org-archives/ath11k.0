Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZh9l-0003At-Qc
 for ath11k@lists.infradead.org; Mon, 02 Nov 2020 21:14:27 +0000
Received: by mail-ej1-x62b.google.com with SMTP id dk16so20236480ejb.12
 for <ath11k@lists.infradead.org>; Mon, 02 Nov 2020 13:14:25 -0800 (PST)
Subject: Re: PROBLEM: unable to get QCA6390 to work
From: Pavel Procopiuc <pavel.procopiuc@gmail.com>
References: <fa22cf0f-3bac-add6-8c71-6f6cad5206d8@gmail.com>
 <87lffjodu7.fsf@codeaurora.org>
 <fa338986-8de4-fde1-6805-d46793c947e4@gmail.com>
Message-ID: <c9cc0ec6-4dda-2608-3575-0e6dfb6d0852@gmail.com>
Date: Mon, 2 Nov 2020 22:14:22 +0100
MIME-Version: 1.0
In-Reply-To: <fa338986-8de4-fde1-6805-d46793c947e4@gmail.com>
Content-Language: en-US
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

After doing some testing I was able to get it running under some specific conditions. I took the v5.9 tag of the main 
kernel tree and merged in the ath11k-qca6390-bringup-202009250825 tag from the ath tree. I had to fix some trivial 
conflicts, but the resulting kernel together with the firmware (amss.bin, m3.bin and board-2.bin) gave me a working 
driver that I was able to use to connect to my AP in both 2,4 and 5GHz.

I then tried to copy over the ath11k driver source resulting from that merge on top of the 5.10-rc2 tag. After fixing 
some API breakage (IEEE80211_TX_CTRL_HW_80211_ENCAP and ieee80211_set_hw_80211_encap) to make it compile I booted into 
the resulting kernel, but ath11k driver was giving me the same firmware errors I had initially on 5.10-rc2. So it looks 
like there might be some change in 5.10 that broke the logic.

Op 02.11.2020 om 19:21 schreef Pavel Procopiuc:
> Ah, my bad, I've now renamed the board-2.bin file, the md5's match yours. But it doesn't seem to have a positive effect. 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
