Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4920DC07E8E
	for <ath11k@archiver.kernel.org>; Mon, 22 Apr 2024 13:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2WIzLwkc4L4PpzEjdws2t5Tlw8sexrblA2Ahm8MDdgY=; b=P3NMrhgBJdSn4WoatTvS4lIvHg
	698b/IydArr0Yh1Q+myfab3c5PPT8MNyf1dRf8bSsX9diJNMjNtPUeXzhKR6br3GAH+0wjA/JRCrE
	nz+4Mylod3TDYMJAKuliMgufgWUn39/lGHz/7wrB8O1lRlHr/t2N9WZE7EC6i1eWQAgOG3HbS6rfz
	gx5ngszABzhHYPXubzl4CvV6ty2lMY4/YHuNV0u02j5mUl1z/xOAK5y4jBfiVjaJEAAG8+LA5+unx
	jaN0dHE/SzdLh77KjOkoxPWx2ZuEMaRX/HL0XZvBk6Bd4ljcOIkHVR3eS7D/aWQCE8yHCvKHReSwQ
	pPyd65sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rytPm-0000000Dg5F-3pEr;
	Mon, 22 Apr 2024 13:08:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rytPh-0000000Dg12-0mmR;
	Mon, 22 Apr 2024 13:08:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3BB9360EAD;
	Mon, 22 Apr 2024 13:08:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19101C2BD11;
	Mon, 22 Apr 2024 13:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713791331;
	bh=J+i9N1KjmFk35PLTmY7h40rPANVS4NetGv5XWCcgOzg=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=tKj1Ev0sDkQi5+KEiB5LhY1YrapyhqPWj1xhNyldEFOrjYMdLC2NQNywPIpM2oCn9
	 KKR+ldrGnJ0vgDJG4XgwKBgLI5FgxOu432nBCICrmXQSH+gCWW0UTDdlAhAQBILxdo
	 xqF/R3vnu4jpugzmTn/hkZBf7SpnConYhE6huJdhyTx4EfL7nhXiFev8vfEpfZp+Lw
	 L0pJcnsCn5VjnI/vxE0yT7hls74KwUcZ1ud9MZJyYKzX2kxFcFbVphu8ZJaYeFhTzP
	 hCEBR8kB/Bdhv+iVxYObXPLD8tw+6rMlMYtLli9sAXUXAWh2sYW2PburZIAgpw4TBX
	 ODeXWH+Ch2/IQ==
From: Kalle Valo <kvalo@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: aleksander.lobakin@intel.com,  kuba@kernel.org,  davem@davemloft.net,
  pabeni@redhat.com,  edumazet@google.com,  elder@kernel.org,
  linux-arm-kernel@lists.infradead.org,
  linux-mediatek@lists.infradead.org,  nbd@nbd.name,
  sean.wang@mediatek.com,  Mark-MC.Lee@mediatek.com,  lorenzo@kernel.org,
  taras.chornyi@plvision.eu,  ath11k@lists.infradead.org,
  ath10k@lists.infradead.org,  linux-wireless@vger.kernel.org,
  geomatsi@gmail.com,  Jeff Johnson <jjohnson@kernel.org>,
  quic_jjohnson@quicinc.com,  leon@kernel.org,
  dennis.dalessandro@cornelisnetworks.com,  linux-kernel@vger.kernel.org,
  netdev@vger.kernel.org,  bpf@vger.kernel.org,  idosch@idosch.org,
  angelogioacchino.delregno@collabora.com,  matthias.bgg@gmail.com
Subject: Re: [PATCH net-next v7 10/10] wifi: ath11k: allocate dummy
 net_device dynamically
References: <20240422123921.854943-1-leitao@debian.org>
	<20240422123921.854943-11-leitao@debian.org>
Date: Mon, 22 Apr 2024 16:08:44 +0300
In-Reply-To: <20240422123921.854943-11-leitao@debian.org> (Breno Leitao's
	message of "Mon, 22 Apr 2024 05:39:03 -0700")
Message-ID: <87le55v92b.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_060853_313185_B07D48DF 
X-CRM114-Status: UNSURE (   9.44  )
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

Breno Leitao <leitao@debian.org> writes:

> Embedding net_device into structures prohibits the usage of flexible
> arrays in the net_device structure. For more details, see the discussion
> at [1].
>
> Un-embed the net_device from struct ath11k_ext_irq_grp by converting it
> into a pointer. Then use the leverage alloc_netdev() to allocate the
> net_device object at ath11k_ahb_config_ext_irq() for ahb, and
> ath11k_pcic_ext_irq_config() for pcic.
>
> The free of the device occurs at ath11k_ahb_free_ext_irq() for the ahb
> case, and ath11k_pcic_free_ext_irq() for the pcic case.
>
> [1] https://lore.kernel.org/all/20240229225910.79e224cf@kernel.org/
>
> Signed-off-by: Breno Leitao <leitao@debian.org>
> Tested-by: Kalle Valo <kvalo@kernel.org>

I assume this goes via net-next:

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

