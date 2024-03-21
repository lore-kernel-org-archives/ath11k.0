Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E19FC54E58
	for <ath11k@archiver.kernel.org>; Thu, 21 Mar 2024 14:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=046LXnkm5D11YWjihvJQgPE1kROYQWwSjc9Z72muVEY=; b=uFruN/iLekSv1llcjZlvXPfkER
	zBG/xKs2AYgNTOj2GVc+LjGnhL03JGo2gj07KRj1UMMu0m5EOfZLDS3x901S+LgFob7SAP7++85kM
	sEXoce1w8HbAMFTZsZGFDBL8QK7LsgM/e7jSIudBIvxglsoT6wJDoEBcRNNqFhYoRLvPySCla/zq4
	OeI6k2jtZ9urenkmKGUKbdraID7B6JekwOF/+XVmkFwJx6+ojRND3ROMmVweRIpM5cJ9CJBWFiAjc
	TjEHwpBSb892BTosL1xEQq7BcicXQvxun0wGTt+GgmbXEid9H3j3AzwaDb2pnvo5ABAqeVDiNOisp
	ycQbh7dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnJN4-00000003GRG-3tZA;
	Thu, 21 Mar 2024 14:26:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnJN2-00000003GQf-1sEz
	for ath11k@lists.infradead.org;
	Thu, 21 Mar 2024 14:26:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E605161173;
	Thu, 21 Mar 2024 14:26:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 351DDC433C7;
	Thu, 21 Mar 2024 14:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711031174;
	bh=VmkGFNifUtWmSip+krIO7T42x5hHDlDV33XxA8/204k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=O9c+rvX8i4il61QRCvQZZIAiCk8lK6SIcYkVxy8tvu8VVBa7Vxh3vIkSosuIIrzbx
	 bQuomSoRPhCETV48+mILsD6OlGTXpRlTGtmWPLF8gCGNOTrheMvrvJ8F1de5P3tZBg
	 KqOe3RMDdhE2z81ls9sa6N0IaYoR79yShQ7AniqyB9joJefWrsfdNx+zD55kh34Atp
	 Ome4EhWb6agk3vxKuMuKa/X7HHwRFbYbt8MxBP3KrSCo8tHes35diAzPqR1n53LpQH
	 rsaIIw2LEQ8olXaPHT84Ki8mRv3EOkHeeTgoRBExiYTSLXLyJDwp2/XQWs5DN1rWA4
	 fbsTNlQruF4tQ==
Date: Thu, 21 Mar 2024 07:26:13 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Breno Leitao <leitao@debian.org>, Kalle Valo <kvalo@kernel.org>, Jeff
 Johnson <jjohnson@kernel.org>, keescook@chromium.org, "open list:NETWORKING
 DRIVERS (WIRELESS)" <linux-wireless@vger.kernel.org>, "open list:QUALCOMM
 ATHEROS ATH11K WIRELESS DRIVER" <ath11k@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath11k: allocate dummy net_device dynamically
Message-ID: <20240321072613.67466168@kernel.org>
In-Reply-To: <a44f21e3-1773-4b56-b1f0-c03a6462a7c1@gmail.com>
References: <20240319185735.1268980-1-leitao@debian.org>
	<a44f21e3-1773-4b56-b1f0-c03a6462a7c1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_072616_560346_AA422E59 
X-CRM114-Status: GOOD (  10.84  )
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

On Wed, 20 Mar 2024 07:05:42 -0700 Florian Fainelli wrote:
> > @@ -533,8 +534,11 @@ static int ath11k_ahb_config_ext_irq(struct ath11k_base *ab)
> >   
> >   		irq_grp->ab = ab;
> >   		irq_grp->grp_id = i;
> > -		init_dummy_netdev(&irq_grp->napi_ndev);
> > -		netif_napi_add(&irq_grp->napi_ndev, &irq_grp->napi,
> > +		irq_grp->napi_ndev = alloc_netdev(0, "dummy", NET_NAME_UNKNOWN,
> > +						  init_dummy_netdev);  
> 
> Is not this going to be a problem with multiple network device drivers 
> loaded in a given system and all using "dummy" here? While 
> NET_NAME_UNKNOWN ensures that this is not exposed to user-space, there 
> is still this part of alloc_netdev_mqs() which is going to be non-unique:
> 
>          ref_tracker_dir_init(&dev->refcnt_tracker, 128, name);

Names are allocated are registration time, I think, so basically all
devices will get an non-uniquely named ref tracker dir. For ethernet
it will be unconverted "eth%d". The name only shows up in some prints,
AFAICT, so not very important?

