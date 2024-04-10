Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF534CD11C2
	for <ath11k@archiver.kernel.org>; Wed, 10 Apr 2024 15:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fDN7LNg3MU1SeI2iaSN0kzB8FZeKumLZXWxQhW85B6o=; b=Oz/F8FqcwUe2CYtw6644gx1LrX
	aMsINCyKfYHxKruZ0nK5L6xzY03TgKEaOZL6gMMtNqsBvM/ow//bdosW3BWA5NOkTP0R7VBNLod/2
	bDA6AgjUPu5JJIHRYzk7rkB9STgCTK0oPD1frVhVD1MhPa0PJuY4EVswJk6XvPyZs/B5s773XV+LL
	OB62z2q4EJiTZUQ1BgaDoUAb2+VJOKhkCzR6Iztfk6xQUnNcTwuZg/NYf7Sj5Q4GsVYH/y7TAPVxr
	fedVRmFrHdw8nGMj4PSOM663Fubv/2+dkpae5oEyT5GLncu8YoZoESBOwvkUb4DMHxjpBJmBLdYQq
	f4ypWsBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruZU5-00000007gF9-1KJV;
	Wed, 10 Apr 2024 15:03:33 +0000
Received: from wfout3-smtp.messagingengine.com ([64.147.123.146])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruZU1-00000007gCb-0jIp;
	Wed, 10 Apr 2024 15:03:30 +0000
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfout.west.internal (Postfix) with ESMTP id C043C1C00081;
	Wed, 10 Apr 2024 11:03:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Wed, 10 Apr 2024 11:03:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1712761401; x=1712847801; bh=fDN7LNg3MU1SeI2iaSN0kzB8FZeK
	umLZXWxQhW85B6o=; b=WFYVPKzf+WTlvkgORk5e+JbUnduryZ++mSz035b372fQ
	nuuwL97dI7BBVgjaBXXEKiIFzh1Xyv01xkS/cq15Jf/6yZYpZtPHaLiypshuFuF3
	pdNQ89u0rPhqaZ0v4nEn/rH0Pm4IWN/RmYSgWwTslJtiTZfFs9TnrC1vfw7hS6cS
	slsC7omM+v2bCRAG4tS98FRNeLa9r/PsYaf6q3SMIfjSW26kXJOAuPipp0e1V/1t
	1gSSXfltOJA0rvVU/U6Bt1i1CuIc3N5d2S3+iWEu2lw7ds4BFcIWg5HbAgpKfY7A
	//X3QyB6pnzMMsz5r74VsH5uH5SzoBvlIUGD+3U+Ug==
X-ME-Sender: <xms:OKoWZqnU0_nEs71C46y4upxl7qPl4h1wr0ptDI2N1EkWGPuRowxEOQ>
    <xme:OKoWZh1-A5K0sHS6Pz9MY-Jkcho3tPyb0Ezz3esBLHAFD3WITI1k-Dra9lZtBIzMW
    GnK_CXTzQcXB7M>
X-ME-Received: <xmr:OKoWZooY5673t2tsp3KDlWLQHLuu_S2mDs72czBwe9btkSIQlt6gBKV7kcyQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudehiedgkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtrodttddtvdenucfhrhhomhepkfguohcu
    ufgthhhimhhmvghluceoihguohhstghhsehiughoshgthhdrohhrgheqnecuggftrfgrth
    htvghrnhepfeefueegheehleelgeehjefgieeltdeuteekkeefheejudffleefgfeludeh
    hfejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
    guohhstghhsehiughoshgthhdrohhrgh
X-ME-Proxy: <xmx:OKoWZunajKgXJvlzXySKL6AtIdjUEocGwBl1aQWCUN20yrdhYwhE6A>
    <xmx:OKoWZo1PtmmB9RkBuY-kuLKW7T5dem6xCJWre-MPRzex3HJzmqr_EA>
    <xmx:OKoWZlsp--rAHoLzaGyDDV9iW1zsiKd9Rl-zswd2O8QO_HZxOI8W5g>
    <xmx:OKoWZkXvmTDOCoYgZzXSBYss2L67git07oFAdqTQjzSm7k4qlvQHtg>
    <xmx:OaoWZt9mVLzcYFfWAX767iMyveSzZBJ9U9WoRGWckea2lIuLxllqdVCr>
Feedback-ID: i494840e7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Apr 2024 11:03:18 -0400 (EDT)
Date: Wed, 10 Apr 2024 18:03:16 +0300
From: Ido Schimmel <idosch@idosch.org>
To: Breno Leitao <leitao@debian.org>
Cc: aleksander.lobakin@intel.com, kuba@kernel.org, davem@davemloft.net,
	pabeni@redhat.com, edumazet@google.com, elder@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, nbd@nbd.name,
	sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	lorenzo@kernel.org, taras.chornyi@plvision.eu,
	ath11k@lists.infradead.org, ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org, geomatsi@gmail.com,
	kvalo@kernel.org, quic_jjohnson@quicinc.com, leon@kernel.org,
	dennis.dalessandro@cornelisnetworks.com,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	bpf@vger.kernel.org, Ido Schimmel <idosch@nvidia.com>,
	Jiri Pirko <jiri@resnulli.us>, Simon Horman <horms@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH net-next v5 01/10] net: core: Fix documentation
Message-ID: <ZhaqNOCeCFSObcPS@shredder>
References: <20240410131407.3897251-1-leitao@debian.org>
 <20240410131407.3897251-2-leitao@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240410131407.3897251-2-leitao@debian.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_080329_360067_C74A93F7 
X-CRM114-Status: UNSURE (   5.06  )
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

On Wed, Apr 10, 2024 at 06:13:42AM -0700, Breno Leitao wrote:
> Fix bad grammer in description of init_dummy_netdev() functio.  This
> topic showed up in the review of the "allocate dummy device dynamically"
> patchset.
> 
> Suggested-by: Ido Schimmel <idosch@nvidia.com>
> Signed-off-by: Breno Leitao <leitao@debian.org>

Reviewed-by: Ido Schimmel <idosch@nvidia.com>

In case you need to send another version:

s/grammer/grammar/
s/functio/function/

