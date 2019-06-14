Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbmur-000618-0a
 for ath11k@lists.infradead.org; Fri, 14 Jun 2019 14:10:56 +0000
Message-ID: <c025150aad17bbe62595c4969ea2f53f009419d3.camel@sipsolutions.net>
Subject: Re: [PATCH v3 0/3] mac80211/ath11k: HE mesh support
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 14 Jun 2019 16:10:46 +0200
In-Reply-To: <20190612193510.29489-1-sven@narfation.org>
 (sfid-20190612_213642_840659_91049B7E)
References: <20190612193510.29489-1-sven@narfation.org>
 (sfid-20190612_213642_840659_91049B7E)
Mime-Version: 1.0
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
To: Sven Eckelmann <sven@narfation.org>, linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org

Hi Sven,

Two comments:

1) It seems to me that patches 1/2 really should be in opposite order,
   since you can't really claim HE mesh support in hwsim when you don't
   have it in mac80211?
   Or maybe I misunderstand?

2) This series breaks the wpas_mesh_max_peering wpa_supplicant/hwsim
   test, and I'm not sure why. Perhaps some length calculations are bad?

johannes


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
