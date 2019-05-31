Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hWYa7-0002Un-Dh
 for ath11k@lists.infradead.org; Fri, 31 May 2019 03:51:52 +0000
Subject: Re: Remaining sparse warnings
From: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Date: Fri, 31 May 2019 03:51:43 +0000
Message-ID: <97b7a885-d357-c1e0-330e-44d00566f1e5@qti.qualcomm.com>
References: <874l5dqkl2.fsf@codeaurora.org>
In-Reply-To: <874l5dqkl2.fsf@codeaurora.org>
Content-Language: en-US
Content-ID: <E285DDA916808F4C868BE272D9F00999@qualcomm.com>
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
To: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>

On Wednesday 29 May 2019 10:11 PM, Kalle Valo wrote:
> Hi,
> 
> there are still few sparse warnings, anyone willing to fix the last
> ones? Though I'm not sure how to fix "dubious: x & !y" warnings, any
> ideas?
> 
> drivers/net/wireless/ath/ath11k/hal_rx.c:118:17: warning: dubious: x & !y
> drivers/net/wireless/ath/ath11k/hal_rx.c:120:17: warning: dubious: x & !y
> drivers/net/wireless/ath/ath11k/hal_rx.c:122:17: warning: dubious: x & !y
> drivers/net/wireless/ath/ath11k/hal_rx.c:124:17: warning: dubious: x & !y
> drivers/net/wireless/ath/ath11k/hal_rx.c:126:17: warning: dubious: x & !y
> drivers/net/wireless/ath/ath11k/hal_rx.c:128:17: warning: dubious: x & !y
> drivers/net/wireless/ath/ath11k/hal_rx.c:130:17: warning: dubious: x & !y
> drivers/net/wireless/ath/ath11k/hal_rx.c:132:17: warning: dubious: x & !y
> drivers/net/wireless/ath/ath11k/hal_rx.c:134:17: warning: dubious: x & !y
> drivers/net/wireless/ath/ath11k/hal_rx.c:136:17: warning: dubious: x & !y
> drivers/net/wireless/ath/ath11k/hal_rx.c:138:17: warning: dubious: x & !y
> drivers/net/wireless/ath/ath11k/hal_rx.c:140:17: warning: dubious: x & !y
> drivers/net/wireless/ath/ath11k/hal_rx.c:142:17: warning: dubious: x & !y
> drivers/net/wireless/ath/ath11k/hal_rx.c:144:17: warning: dubious: x & !y
> drivers/net/wireless/ath/ath11k/hal_rx.c:146:17: warning: dubious: x & !y
> drivers/net/wireless/ath/ath11k/hal_rx.c:148:17: warning: dubious: x & !y
> drivers/net/wireless/ath/ath11k/hal_rx.c:150:17: warning: dubious: x & !y
> drivers/net/wireless/ath/ath11k/hal_rx.c:152:17: warning: dubious: x & !y
> drivers/net/wireless/ath/ath11k/hal_rx.c:154:17: warning: dubious: x & !y
> drivers/net/wireless/ath/ath11k/hal_rx.c:156:17: warning: dubious: x & !y
> drivers/net/wireless/ath/ath11k/hal_rx.c:158:17: warning: dubious: x & !y
> drivers/net/wireless/ath/ath11k/hal_rx.c:160:17: warning: dubious: x & !y
> drivers/net/wireless/ath/ath11k/hal_rx.c:166:17: warning: dubious: x & !y
> drivers/net/wireless/ath/ath11k/hal_rx.c:170:17: warning: dubious: x & !y
> drivers/net/wireless/ath/ath11k/hal_rx.c:172:17: warning: dubious: x & !y
> drivers/net/wireless/ath/ath11k/hal_rx.c:176:17: warning: dubious: x & !y
> drivers/net/wireless/ath/ath11k/hal_rx.c:178:17: warning: dubious: x & !y
> drivers/net/wireless/ath/ath11k/hal_rx.c:180:17: warning: dubious: x & !y
> drivers/net/wireless/ath/ath11k/hal_rx.c:182:17: warning: dubious: x & !y
> drivers/net/wireless/ath/ath11k/hal_rx.c:184:17: warning: dubious: x & !y
> drivers/net/wireless/ath/ath11k/hal_rx.c:186:17: warning: dubious: x & !y
> drivers/net/wireless/ath/ath11k/hal_rx.c:188:17: warning: dubious: x & !y
> drivers/net/wireless/ath/ath11k/hal_rx.c:190:17: warning: dubious: x & !y
> drivers/net/wireless/ath/ath11k/hal_rx.c:192:17: warning: dubious: x & !y
> drivers/net/wireless/ath/ath11k/hal_rx.c:212:17: warning: dubious: x & !y
> drivers/net/wireless/ath/ath11k/hal_rx.c:216:17: warning: dubious: x & !y
> drivers/net/wireless/ath/ath11k/hal_rx.c:218:17: warning: dubious: x & !y
> drivers/net/wireless/ath/ath11k/dp_tx.c:665:23: warning: dubious: x & !y
> drivers/net/wireless/ath/ath11k/dp_tx.c:667:23: warning: dubious: x & !y
> drivers/net/wireless/ath/ath11k/dp_tx.c:670:23: warning: dubious: x & !y
> drivers/net/wireless/ath/ath11k/dp_tx.c:830:23: warning: dubious: x & !y
> drivers/net/wireless/ath/ath11k/dp_tx.c:832:23: warning: dubious: x & !y

To me, this seems like a false warning, I do not see any issue with the way values are passed
to FIELD_PREP() macro.

> drivers/net/wireless/ath/ath11k/dp_tx.c:837:33: warning: incorrect type in assignment (different base types)
> drivers/net/wireless/ath/ath11k/dp_tx.c:837:33:    expected unsigned int [usertype] pkt_type_en_flags0
> drivers/net/wireless/ath/ath11k/dp_tx.c:837:33:    got restricted __le32 [usertype]
> drivers/net/wireless/ath/ath11k/dp_tx.c:838:33: warning: incorrect type in assignment (different base types)
> drivers/net/wireless/ath/ath11k/dp_tx.c:838:33:    expected unsigned int [usertype] pkt_type_en_flags1
> drivers/net/wireless/ath/ath11k/dp_tx.c:838:33:    got restricted __le32 [usertype]
> drivers/net/wireless/ath/ath11k/dp_tx.c:839:33: warning: incorrect type in assignment (different base types)
> drivers/net/wireless/ath/ath11k/dp_tx.c:839:33:    expected unsigned int [usertype] pkt_type_en_flags2
> drivers/net/wireless/ath/ath11k/dp_tx.c:839:33:    got restricted __le32 [usertype]
> drivers/net/wireless/ath/ath11k/dp_tx.c:840:33: warning: incorrect type in assignment (different base types)
> drivers/net/wireless/ath/ath11k/dp_tx.c:840:33:    expected unsigned int [usertype] pkt_type_en_flags3
> drivers/net/wireless/ath/ath11k/dp_tx.c:840:33:    got restricted __le32 [usertype]
> drivers/net/wireless/ath/ath11k/dp_tx.c:841:28: warning: incorrect type in assignment (different base types)
> drivers/net/wireless/ath/ath11k/dp_tx.c:841:28:    expected unsigned int [usertype] rx_filter_tlv
> drivers/net/wireless/ath/ath11k/dp_tx.c:841:28:    got restricted __le32 [usertype]
> 

Ill take a loot at these warnings.

Vasanth
_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
