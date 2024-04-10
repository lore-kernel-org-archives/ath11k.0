Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4672CCD128A
	for <ath11k@archiver.kernel.org>; Wed, 10 Apr 2024 15:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TDGvkul+Q73nN0fHZOhTAHooDQZwt3FC9x/QxxSs3zo=; b=zAXe/TqTHQMfkY/nOQkLK0N9Jx
	jQ4PNOrGyZRJi2sESN2ioWZwEFHru8Goy+tbdZlPM0vPo4T/du4IeRjF5Jc24rZkQtbEscPuYKW/C
	Zmq/CaV5BMu+Gj9/U1m7EkE1F9uVcSZQ0S6TpslGzvch1/ICjuVTpA1LKD17XiBvbPXEezxPq5lCS
	2zhsIEhDTWIhEPjmU2gpPDreTlin/6fZ0XDhLQIeujapMXuEkr4YqNbyTIJnbdgWbpNHlnxuzU5lk
	/+9w8Gc+uSeOouI//gTaJ1KRtLuXeexoQCodEMUSk9snAr9p7i5ogla41kksiM27gNiZkKVsuZ4Dq
	BRv8cwlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruZWV-00000007grY-3GN4;
	Wed, 10 Apr 2024 15:06:03 +0000
Received: from wfhigh3-smtp.messagingengine.com ([64.147.123.154])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruZWR-00000007gpw-3x2k;
	Wed, 10 Apr 2024 15:06:01 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id AF66B18000F0;
	Wed, 10 Apr 2024 11:05:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 10 Apr 2024 11:05:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1712761552; x=1712847952; bh=TDGvkul+Q73nN0fHZOhTAHooDQZw
	t3FC9x/QxxSs3zo=; b=SNGUDwkXjBq6YtQxxM3lA3GMHmXSrT2cy2J4JaBa5KHE
	Hc+xeukLb0K8D1cZxsH4khv3vX5w4V26Ev7YwRBsBzEtfVxXcQG/DDo7Wq92YHEw
	dcfJTEmtqnjPnc9NgFt/el+AJwp41r1btXkQrABaZ7W99StTxiXT58NBJ8p2lltD
	iUKRp+tK1x7+tt/v5GS20dHXtRAxxLkSGlKzr4tdgJHRLM34nG7atn/SqZAqyZjE
	Kghp5JrU2hT2wOiFqGuku2InwpV8r62JpiCDJeaLhY1qurB+4dCCtq3yEjCwQQhp
	exn1cwQNlaGDPugyI06Ob69hDT0wm+lzpi7kihAHuA==
X-ME-Sender: <xms:z6oWZirsV-nMSlBJ_lJHht3gSOq-1b8CG2vrEJEIev3ET7Gg5BIBhw>
    <xme:z6oWZgpmS8OJjlntZPqhKVYsG_Ms_fMU82xVOyAvV8_0Lf8-lfkq0Hq4pN2Xy7GMZ
    deF3Ovb49n63Gc>
X-ME-Received: <xmr:z6oWZnPGX5nP-7JRHmiHleiBxQF-dNbP1wTCXQU8oUbIv9e_gjPq_L4IW_Kc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudehiedgkedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepkfguohcu
    ufgthhhimhhmvghluceoihguohhstghhsehiughoshgthhdrohhrgheqnecuggftrfgrth
    htvghrnhepvddufeevkeehueegfedtvdevfefgudeifeduieefgfelkeehgeelgeejjeeg
    gefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
    guohhstghhsehiughoshgthhdrohhrgh
X-ME-Proxy: <xmx:z6oWZh49-kpbe5t6iou3vs4d-1A5eJnaI5xAIu1_4gCElWtyVPM-Cw>
    <xmx:z6oWZh6-YFeqxhU1DrfRO3jic7Oo4N5ICNItdUDiCIzLDV9VlwEIDQ>
    <xmx:z6oWZhiDjueR4bTXrVLEOVXiuABAM3tjPYq_DnwRZaBQzewPK0MBUA>
    <xmx:z6oWZr7yMr5pEO2Zbdcw9y9CBMvABVOix3FefIk--Aup764a9f9V1w>
    <xmx:0KoWZumSlhW9MHX9P70o-XAB3cMSnYOwHvogsN-suiaqrMuljzfLXBGb>
Feedback-ID: i494840e7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Apr 2024 11:05:50 -0400 (EDT)
Date: Wed, 10 Apr 2024 18:05:47 +0300
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
	bpf@vger.kernel.org, Jiri Pirko <jiri@resnulli.us>,
	Simon Horman <horms@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH net-next v5 02/10] net: free_netdev: exit earlier if dummy
Message-ID: <Zhaqyyk9CUaUvMDy@shredder>
References: <20240410131407.3897251-1-leitao@debian.org>
 <20240410131407.3897251-3-leitao@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240410131407.3897251-3-leitao@debian.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_080600_038643_1B5C6B33 
X-CRM114-Status: UNSURE (   8.54  )
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

On Wed, Apr 10, 2024 at 06:13:43AM -0700, Breno Leitao wrote:
> For dummy devices, exit earlier at free_netdev() instead of executing
> the whole function. This is necessary, because dummy devices are
> special, and shouldn't have the second part of the function executed.
> 
> Otherwise reg_state, which is NETREG_DUMMY, will be overwritten and
> there will be no way to identify that this is a dummy device. Also, this
> device do not need the final put_device(), since dummy devices are not
> registered (through register_netdevice()), where the device reference is
> increased (at netdev_register_kobject()/device_add()).
> 
> Suggested-by: Jakub Kicinski <kuba@kernel.org>
> Signed-off-by: Breno Leitao <leitao@debian.org>

Reviewed-by: Ido Schimmel <idosch@nvidia.com>

