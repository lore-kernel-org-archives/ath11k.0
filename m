Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQEQA-0005qS-Pk
 for ath11k@lists.infradead.org; Mon, 13 May 2019 17:07:28 +0000
MIME-Version: 1.0
Subject: Re: [PATCH V4 1/5] ath11k: move phymode selection from function to
 array lookup
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20190509201550.3977-2-john@phrozen.org>
References: <20190509201550.3977-2-john@phrozen.org>
Message-Id: <20190513170725.C86DE60769@smtp.codeaurora.org>
Date: Mon, 13 May 2019 17:07:25 +0000 (UTC)
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
Cc: ath11k@lists.infradead.org, Shashidhar Lakkavalli <slakkavalli@datto.com>

John Crispin <john@phrozen.org> wrote:

> With HE support getting added, the approach of using functions will quickly
> get convoluted. Change the code to use an array lookup function instead.
> 
> Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
> Signed-off-by: John Crispin <john@phrozen.org>

Failed to apply:

drivers/net/wireless/ath/ath10k/mac.c: In function 'chan_to_phymode':
drivers/net/wireless/ath/ath10k/mac.c:567:3: warning: enumeration value '__NL80211_CHAN_WIDTH_NUM' not handled in switch [-Wswitch]
   switch (chandef->width) {
   ^~~~~~
drivers/net/wireless/ath/ath10k/mac.c:590:3: warning: enumeration value '__NL80211_CHAN_WIDTH_NUM' not handled in switch [-Wswitch]
   switch (chandef->width) {
   ^~~~~~
drivers/net/wireless/ath/ath11k/mac.c: In function 'ath11k_peer_assoc_h_he':
drivers/net/wireless/ath/ath11k/mac.c:1296:6: error: 'struct peer_assoc_params' has no member named 'twt_responder'
   arg->twt_responder = true;
      ^~
drivers/net/wireless/ath/ath11k/mac.c:1298:6: error: 'struct peer_assoc_params' has no member named 'twt_requester'
   arg->twt_requester = true;
      ^~
make[5]: *** [drivers/net/wireless/ath/ath11k/mac.o] Error 1
make[4]: *** [drivers/net/wireless/ath/ath11k] Error 2
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [drivers/net/wireless/ath] Error 2
make[2]: *** [drivers/net/wireless] Error 2
make[1]: *** [drivers/net] Error 2
make: *** [drivers] Error 2
make: *** Waiting for unfinished jobs....

5 patches set to Changes Requested.

10937617 [V4,1/5] ath11k: move phymode selection from function to array lookup
10937615 [V4,2/5] ath11k: add HE handling to the debug code
10937625 [V4,3/5] ath11k: extend reading of FW capabilities
10937619 [V4,4/5] ath11k: handle rx status for HE frames
10937623 [V4,5/5] ath11k: add HE support

-- 
https://patchwork.kernel.org/patch/10937617/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
