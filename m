Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD11C54EAA
	for <ath11k@archiver.kernel.org>; Fri, 27 Jan 2023 00:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZICrYnWML8xqJ8BOMu0gvwQre0vyo5wnPA/t6BzLc0o=; b=ktcvhWvlP8lHjP
	6wdMbFMfYr1sMhHp13o8D7yihibZCt9rEuUQ1C0WLK8bKr93tRDoFqDGFBZ5DVP4Qe6vkW5ZQ+Gfs
	I4cz5zBvff1G4wK+No436921K17aG6JL12gHt2H/av0wopfDSybfzTOPEX7lWjtzDoq5CUBJ6Pp9S
	QfKGFLq0dfKJ6E9AQg8d8sExlWGtfBeZ7mXpu/aIdcwYk6TUk0HRBu2QrBEQTDrnxWPWZho0lWiWX
	9bWYT+a4axUSK6xDUh36kn5fXSfiQz4s8MCRTAK3nnA+PCmoEFC1k1uSNOALvI/bkubpo+Pb3B4sa
	LY/ixh2gAWX3TOfAeopQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLCar-00Czde-Fj; Fri, 27 Jan 2023 00:27:49 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLCap-00Czd1-Ok; Fri, 27 Jan 2023 00:27:47 +0000
Date: Thu, 26 Jan 2023 16:27:47 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Doug Anderson <dianders@chromium.org>
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
Message-ID: <Y9Mag0CmfhRKdmZD@bombadil.infradead.org>
References: <20230124110057.1.I69cf3d56c97098287fe3a70084ee515098390b70@changeid>
 <Y9LODwJPQpPs32Ds@bombadil.infradead.org>
 <CAD=FV=WEQL+Kik9ZkvtzNKN+-ofZ=-g3OzyUnnJc7PWnRzLdEw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=WEQL+Kik9ZkvtzNKN+-ofZ=-g3OzyUnnJc7PWnRzLdEw@mail.gmail.com>
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

On Thu, Jan 26, 2023 at 04:14:42PM -0800, Doug Anderson wrote:
> > To that end. Why not write an SmPL Coccinelle grammer patch for this
> > and put it on scripts/coccinelle/api ? Then hunt / convert things which
> > will use DT as well and where this is actually useful / likely buggy.
> 
> That sounds like a great idea. ...but not something I'm going to do.

:*(

  Luis

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
