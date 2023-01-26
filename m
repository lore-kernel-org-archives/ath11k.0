Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9F9C61DA3
	for <ath11k@archiver.kernel.org>; Thu, 26 Jan 2023 19:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pBl1vVja27uOc1KpElS4Tm+Z4wROcHEPUkuzFPNjXDc=; b=GzvTvg2ZFyn/Ji
	ErO5IepfIAa9df7p58nsbb0wW2CKYDWjeDjg9CPBhDOVaLj1b+cBpZ5DUsrg/DvprpA52hvkAL3/O
	vq6hfVIyz6BhhnJSZTnAos9C/jXQKxy9Iw8yJTe6OgjaNoNiLOJ9FOJ5NBMD/hka6iTFDiQRxrV4J
	Id6rCp/hzZPjP7KRZVAMDGPZkmX991odCUO/HKp1k1eaiNxVm3FnES4McE3WxLH3sOPe9J9gmQsVs
	0rwD3r2ZC7j4HjLPKWtGIim7MOHJVrWuOKq5zduu6xaHHCUHmCA6mKHPntkBw/vwmFzsgS6fVfybf
	rK75CV6SmHGqWXS7stTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL7VC-00CEwd-9p; Thu, 26 Jan 2023 19:01:38 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL7V9-00CEvd-Pq; Thu, 26 Jan 2023 19:01:35 +0000
Date: Thu, 26 Jan 2023 11:01:35 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
	Nick Kossifidis <mickflemm@gmail.com>,
	Youghandhar Chintala <quic_youghand@quicinc.com>,
	junyuu@chromium.org, Kalle Valo <kvalo@kernel.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 1/2] wifi: ath11k: Use platform_get_irq() to get the
 interrupt
Message-ID: <Y9LODwJPQpPs32Ds@bombadil.infradead.org>
References: <20230124110057.1.I69cf3d56c97098287fe3a70084ee515098390b70@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230124110057.1.I69cf3d56c97098287fe3a70084ee515098390b70@changeid>
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
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
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Tue, Jan 24, 2023 at 11:01:00AM -0800, Douglas Anderson wrote:
> For the same reasons talked about in commit 9503a1fc123d ("ath9k: Use
> platform_get_irq() to get the interrupt"), we should be using
> platform_get_irq() in ath11k. Let's make the switch.

The commit log is rather weak, it is better to re-state what the commit
log in 9503a1fc123d states as it is stronger, and very clear.

To that end. Why not write an SmPL Coccinelle grammer patch for this
and put it on scripts/coccinelle/api ? Then hunt / convert things which
will use DT as well and where this is actually useful / likely buggy.

  Luis

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
