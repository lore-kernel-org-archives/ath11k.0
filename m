Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kB4jh-0002HX-Sh
 for ath11k@lists.infradead.org; Wed, 26 Aug 2020 23:21:46 +0000
Date: Wed, 26 Aug 2020 16:21:33 -0700 (PDT)
Message-Id: <20200826.162133.1378636842290936380.davem@davemloft.net>
Subject: Re: [PATCH net-next 0/6] drivers/net: constify static ops-variables
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200826225608.90299-1-rikard.falkeborn@gmail.com>
References: <20200826225608.90299-1-rikard.falkeborn@gmail.com>
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
To: rikard.falkeborn@gmail.com
Cc: andrew@lunn.ch, antoine.tenart@bootlin.com, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux@armlinux.org.uk, linux-renesas-soc@vger.kernel.org, sergei.shtylyov@gmail.com, kuba@kernel.org, ath11k@lists.infradead.org, kvalo@codeaurora.org, hkallweit1@gmail.com

From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
Date: Thu, 27 Aug 2020 00:56:02 +0200

> This series constifies a number of static ops variables, to allow the
> compiler to put them in read-only memory. Compile-tested only.

Series applied, thank you.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
