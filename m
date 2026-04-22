Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB62F9B5F6
	for <ath11k@archiver.kernel.org>; Wed, 22 Apr 2026 09:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s0oefb6fcUYX/wyXNUxQCgifhWpkqsHf3pJ+W/pLsDI=; b=VioLe5UNzBfwVctv9p/YmWAQs8
	KXl+w5VzQHqqD7U7eMoj4r19Nqvztj0rskA4uYLWkJKu4N1bbk6lgSonwOexs8+jtRIJqQmlABeGW
	pMvE7yZDOKi4AlWcOA6D4zmeYUtNFBFrxoSMJ4WrH4d2v7pguAP/mM/bKrQLwFSwaUEqWYEzN4oAu
	5c7i7jJAkOpX26J7znj+LJ3FsQoPnr4AWstlscmS1WbMy6Uib6A9k/j1O8GvSthED3SFMWzf0/DvB
	5YeBuFoMeLr0Lt987WoQ7kiLF6wbCXIK4RXUtWpcHlwvqtq+Q9jm/udABf0xbj9O1vcjbVAES3Hd1
	J/HheG/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFTkb-00000009plH-1Y1x;
	Wed, 22 Apr 2026 09:20:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFTkZ-00000009pkp-0ijq;
	Wed, 22 Apr 2026 09:20:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5899540BFD;
	Wed, 22 Apr 2026 09:20:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC7EDC19425;
	Wed, 22 Apr 2026 09:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776849602;
	bh=DpOEJWEbgy2EUIdAGmq2P4VnzdGsa4AlW6mJFjN6PwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UuyrWoo/xf5nGazq35hR0q2RXtNpo6PANgA5dj5aWydhM6d4MmJNPyu0pUxwQbwgT
	 +5ghBBHRsFi4BEGsP0unkz75GUvQQl7VVh4rsxyLO+9uu5J9+AkoX07iAWXyRu0vGw
	 7zrU/imsnECPWBVYwYOM7vf4xXvQxduqIGOdPDPM2BcYUb6mA4PkQmJyRni8LWNaJF
	 ApkZaCEQaauIQaxFdfDLF3zx4OhX+SDgN8fplrR2xs5bVBYc0EwmagTVSThAkS3ypr
	 K7ty1GBMArtRgQROxzYgMHbhsvMHInLf+OCq5Hjg+Y/qYSAPlFuzX58VOcka23aD6q
	 zfKZLUg1Qw/uQ==
Date: Wed, 22 Apr 2026 11:19:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Stephan Gerhold <stephan@gerhold.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Jeff Johnson <jjohnson@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Mark Brown <broonie@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Yang Xiwen <forbidden405@outlook.com>, Alex Elder <elder@kernel.org>, 
	Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
	Rao Mandadapu <quic_srivasam@quicinc.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, ath11k@lists.infradead.org, 
	linux-pci@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Fix phandle-array constraints, again
Message-ID: <20260422-proud-quartz-mastodon-fafb9e@quoll>
References: <20260421195836.1547469-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260421195836.1547469-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_022003_238597_1D4F3E5A 
X-CRM114-Status: UNSURE (   9.15  )
X-CRM114-Notice: Please train this message.
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Tue, Apr 21, 2026 at 02:55:25PM -0500, Rob Herring (Arm) wrote:
> The unfortunately named 'phandle-array' property type is really a matrix
> with phandle and fixed arg cells entries. A matrix property should have 2
> levels of items constraints.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> Can someone from QCom provide some descriptions for 'qcom,smem-states'
> properties.

Working on it...

Best regards,
Krzysztof


