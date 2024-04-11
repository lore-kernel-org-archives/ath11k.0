Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A33CD1284
	for <ath11k@archiver.kernel.org>; Thu, 11 Apr 2024 08:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RGu/0ma3ezFeXYAMPoATRHDCuVlhyus9tFn/tyNcnZA=; b=WcGTCtlmbUjZgv6IRkAv5BMho/
	XeXLwRaIIcL7axEV2qBs3ksRMEWA8Mbt+Dkc5eHEjMk0xswALKQiDEy7SWtFc1S0wtGDqUmaKuU7j
	t/GbNcbIhXDH14Yhoo0o8e5tttoUa/OnoicYAo2K1N1A47m/hz/PMJszewV1ZgwdLjZ9wM6YV21Bf
	agYcwkHDKkhtLxdC8zEHvPA3aOUyl/iRLqW6bb1tFP3sarfUEqxiG/Xk9FoMz1rSi31miGUk+ksKZ
	p/wnGqLrfBWmxdfBTZkehIaqcr8I9g1aH/Q4mMBWMtHDW/9kUgl98GPt8jHPYH8UlZDGinjOnA1TQ
	oVflFpRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rupxT-0000000B8Lp-1Aee;
	Thu, 11 Apr 2024 08:38:59 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rupxP-0000000B8KB-3pHc;
	Thu, 11 Apr 2024 08:38:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E3577CE2F8D;
	Thu, 11 Apr 2024 08:38:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BF14C433F1;
	Thu, 11 Apr 2024 08:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712824733;
	bh=hFPKYBGIMfpUrwovYlZJbiVjlexhjRbaRyeGHPPWlns=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=NAFuS0Ppx0+PkVXSEJz4rvVpoClDsOe3OP/22UTvK7TVNvqysCmc8ya7CP2kXYKvq
	 MEzj40HuEA/CIdTXGdMDf4FVp2dQlSbFqLoCRy35QUEqVmt8aFV8jgAtdGQoqiZq6b
	 BcfQG6FtYZhS9tDybY8gp5mq07k1BpKuWR7Te7A3rCLgTY2AW/t69iINWHG4b/X7GT
	 4vOoFym4qjz6G+QWNyugZh3HemWLtgqsvwx0eVo+r65d63JWxk7GFJXZAY+IE1RxEt
	 Du5oakGX1TS7W6YWY6MWkYSCOM8v+fPCQQ03DzRgwDh08cEfH0rlwvp3CzAPwRwrjf
	 MW64XnTh5rKaQ==
From: Kalle Valo <kvalo@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: aleksander.lobakin@intel.com,  kuba@kernel.org,  davem@davemloft.net,
  pabeni@redhat.com,  edumazet@google.com,  elder@kernel.org,
  linux-arm-kernel@lists.infradead.org,
  linux-mediatek@lists.infradead.org,  nbd@nbd.name,
  sean.wang@mediatek.com,  Mark-MC.Lee@mediatek.com,  lorenzo@kernel.org,
  taras.chornyi@plvision.eu,  ath11k@lists.infradead.org,
  ath10k@lists.infradead.org,  linux-wireless@vger.kernel.org,
  geomatsi@gmail.com,  Matthias Brugger <matthias.bgg@gmail.com>,
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
  quic_jjohnson@quicinc.com,  leon@kernel.org,
  dennis.dalessandro@cornelisnetworks.com,  linux-kernel@vger.kernel.org,
  netdev@vger.kernel.org,  bpf@vger.kernel.org,  idosch@idosch.org
Subject: Re: [PATCH net-next v5 00/10] allocate dummy device dynamically
References: <20240410131407.3897251-1-leitao@debian.org>
Date: Thu, 11 Apr 2024 11:38:45 +0300
In-Reply-To: <20240410131407.3897251-1-leitao@debian.org> (Breno Leitao's
	message of "Wed, 10 Apr 2024 06:13:41 -0700")
Message-ID: <87frvsz42y.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_013856_341063_5AC0CB40 
X-CRM114-Status: GOOD (  17.90  )
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

Breno Leitao <leitao@debian.org> writes:

> struct net_device shouldn't be embedded into any structure, instead,
> the owner should use the private space to embed their state into
> net_device.
>
> But, in some cases the net_device is embedded inside the private
> structure, which blocks the usage of zero-length arrays inside
> net_device.
>
> Create a helper to allocate a dummy device at dynamically runtime, and
> move the Ethernet devices to use it, instead of embedding the dummy
> device inside the private structure.
>
> This fixes all the network cases plus some wireless drivers.
>
> PS: Due to lack of hardware, unfortunately most these patches are
> compiled tested only, except ath11k that was kindly tested by Kalle Valo.
>
> ---
> Changelog:
>
> v1:
> 	* https://lore.kernel.org/all/20240327200809.512867-1-leitao@debian.org/
>
> v2:
> 	* Patch 1: Use a pre-defined name ("dummy#") for the dummy
> 	  net_devices.
> 	* Patch 2-5: Added users for the new helper.
> v3:
> 	* Use free_netdev() instead of kfree() as suggested by Jakub.
> 	* Change the free_netdev() place in ipa driver, as suggested by
> 	  Alex Elder.
> 	* Set err in the error path in the Marvell driver, as suggested
> 	  by Simon Horman.
> v4:
> 	* Added a new patch to add dummy device at free_netdev(), as suggested
> 	  by Jakub.
> 	* Added support for some wireless driver.
> 	* Added some Acked-by and Reviewed-by.
> v5:
> 	* Added a new patch to fix some typos in the previous code,
> 	  suggested by Ido.
> 	* Rebased to net-net/main

I'm nitpicking here but I prefer to have the changelog in reverse order,
that is v5 first and v1 last. I'm most interested about the changes in
v5, I don't care about v1 at this point. Though I don't know if net
folks have a different prefence, just wanted to mention this.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

