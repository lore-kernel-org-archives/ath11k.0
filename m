Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1VaP-0001wF-3y
 for ath11k@lists.infradead.org; Tue, 11 Feb 2020 13:28:24 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 4/4] ath11k: add more HE fields into radiotap header
References: <20200204151135.25302-1-john@phrozen.org>
 <20200204151135.25302-4-john@phrozen.org>
Date: Tue, 11 Feb 2020 15:27:56 +0200
In-Reply-To: <20200204151135.25302-4-john@phrozen.org> (John Crispin's message
 of "Tue, 4 Feb 2020 16:11:35 +0100")
Message-ID: <878sl9xnhf.fsf@kamboji.qca.qualcomm.com>
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
To: John Crispin <john@phrozen.org>
Cc: Miles Hu <milehu@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

John Crispin <john@phrozen.org> writes:

> From: Miles Hu <milehu@codeaurora.org>
>
> This patch adds code to parse HE fields inside ppdu TLVs. Then it adds the
> populates the additional info into the ratiotap header. Also fix missing QoS
> tag in native wifi mode. Finally rssi and tsf are also added.
>
> Signed-off-by: Miles Hu <milehu@codeaurora.org>
> Tested-by: John Crispin <john@phrozen.org>

John's s-o-b missing and loads of warnings:

drivers/net/wireless/ath/ath11k/hal_rx.c: In function 'ath11k_hal_rx_parse_mon_status_tlv':
drivers/net/wireless/ath/ath11k/hal_rx.c:1074:13: warning: variable 'cp_ltf' set but not used [-Wunused-but-set-variable]
drivers/net/wireless/ath/ath11k/hal_rx.c:822:48: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath11k/hal_rx.c:822:48:    expected unsigned int [usertype] ul_ofdma_user_v0_word0
drivers/net/wireless/ath/ath11k/hal_rx.c:822:48:    got restricted __le32 [usertype] info6
drivers/net/wireless/ath/ath11k/hal_rx.c:824:48: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath11k/hal_rx.c:824:48:    expected unsigned int [usertype] ul_ofdma_user_v0_word1
drivers/net/wireless/ath/ath11k/hal_rx.c:824:48:    got restricted __le32
drivers/net/wireless/ath/ath11k/hal_rx.c:835:17: warning: cast to restricted __le32
drivers/net/wireless/ath/ath11k/hal_rx.c:835:17: warning: restricted __le32 degrades to integer
drivers/net/wireless/ath/ath11k/hal_rx.c:835:17: warning: restricted __le32 degrades to integer
drivers/net/wireless/ath/ath11k/hal_rx.c:838:17: warning: cast to restricted __le32
drivers/net/wireless/ath/ath11k/hal_rx.c:838:17: warning: restricted __le32 degrades to integer
drivers/net/wireless/ath/ath11k/hal_rx.c:838:17: warning: restricted __le32 degrades to integer
drivers/net/wireless/ath/ath11k/hal_rx.c:951:60: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath11k/hal_rx.c:951:60:    expected unsigned int
drivers/net/wireless/ath/ath11k/hal_rx.c:951:60:    got restricted __le32
drivers/net/wireless/ath/ath11k/hal_rx.c:952:60: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath11k/hal_rx.c:952:60:    expected unsigned int
drivers/net/wireless/ath/ath11k/hal_rx.c:952:60:    got restricted __le32
drivers/net/wireless/ath/ath11k/hal_rx.c:1469:33: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath11k/hal_rx.c:1469:33:    expected unsigned long long [usertype] tsft
drivers/net/wireless/ath/ath11k/hal_rx.c:1469:33:    got restricted __le32
drivers/net/wireless/ath/ath11k/hal_rx.c:1470:84: warning: restricted __le32 degrades to integer
drivers/net/wireless/ath/ath11k/dp_rx.c:3894: braces {} are not necessary for single statement blocks

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
