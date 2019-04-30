Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLMVx-0006fN-UD
 for ath11k@lists.infradead.org; Tue, 30 Apr 2019 06:45:19 +0000
MIME-Version: 1.0
Date: Mon, 29 Apr 2019 23:45:17 -0700
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [PATCH V2 2/3] mac80211: dynamically turn TWT requester support
 on and off
In-Reply-To: <20190426094150.18078-3-john@phrozen.org>
References: <20190426094150.18078-1-john@phrozen.org>
 <20190426094150.18078-3-john@phrozen.org>
Message-ID: <a580242a242ec6126928bba5227f1e2d@codeaurora.org>
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
To: John Crispin <john@phrozen.org>
Cc: linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>, Srini Kode <skode@qti.qualcomm.com>, Shashidhar Lakkavalli <slakkavalli@datto.com>, Johannes Berg <johannes@sipsolutions.net>, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

On 2019-04-26 02:41, John Crispin wrote:
> Turn TWT on/off for STA interfaces when they associate and/or receive a
> beacon where the twt_responder bit has changed.
> 

Does it mean that TWT responder can be turn on/off when AP is UP and 
running?
I thought any change in beacon needs AP restart. no?

-Rajkumar

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
