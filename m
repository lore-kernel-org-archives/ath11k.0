Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5703C54E5D
	for <ath11k@archiver.kernel.org>; Thu, 14 Mar 2024 16:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lJvWKb+2KS84VgxKqZ81qAh+2twGEGXjcl8B5ZguKoY=; b=Nn/Nl0EO2wb6ATguvEDyzHuTOs
	ndmYeZ5UHGmIMdEo42O1jN3qrUdyRQuKljoEjm+vmJ3ZnxlKfsYi+Qfsvhv0CLdShdrMb9uISoG1G
	fHfnRjyXCL42oqYFyDPOy18f9ctECPcHATOJWeAqULSkyC2SFpxVyJkugFsadU5lY+3asjbbXD12q
	HO2srd89GmMLMw4K6uWXpHg2oDpIRHXcK5fLZdhxTn3WWGMZok0xnJ/2lnftoQ6fY6RbcxHAyaK2r
	boAmE8NG6tMTL/YCFizr4Lj/fpkxpqwyyzUTv2iMaFyCubwLark2BXe6irrcqg/h/8iwAOKEf4v30
	PMS9HI3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rko9K-0000000F2FQ-2xzL;
	Thu, 14 Mar 2024 16:41:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rko9H-0000000F2Ex-3DIN
	for ath11k@lists.infradead.org;
	Thu, 14 Mar 2024 16:41:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 31A1A614E6;
	Thu, 14 Mar 2024 16:41:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E545FC433F1;
	Thu, 14 Mar 2024 16:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710434501;
	bh=sPw89LfyZm0F1ziV09IYWXQhMlHw2bEAtttpScIXKys=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=GO7deHE8/iMLIDY/izre5RNQCgsb+908yEXH2YBz9mfFejmVhZM+NRLJJDS0MYt/m
	 9m5CFNwWB5k3FRtI0aiJpnD5imAEQj7vkNIwQ3O8fENZln0bCgSg7lkda/fwwmzPJv
	 53EGyxtR7zrcvUe9X9tE+Qjp7OrJonrLJwnBgbLOq09H1mothudIxH5Cioo33xFjl7
	 alocdUwV96HiVISXqo5SXz6l5YQmVe7AveIXOccs31QHEiLV3YG2jgCYDRK33vJoIW
	 pfg/PFC11pWkeSHVskrQc0AN6E6CRJTuxFETeg4230iMPibmEqnqnn7CBE+IFgQhhy
	 IP+b+1wstViyA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/6] wifi: ath11k: change interface combination for P2P
 mode
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240228093537.25052-2-quic_kangyang@quicinc.com>
References: <20240228093537.25052-2-quic_kangyang@quicinc.com>
To: Kang Yang <quic_kangyang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_kangyang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171043449897.2496983.14481800262284990010.kvalo@kernel.org>
Date: Thu, 14 Mar 2024 16:41:40 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_094143_884571_4E0FEB7F 
X-CRM114-Status: UNSURE (   5.65  )
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

Kang Yang <quic_kangyang@quicinc.com> wrote:

> Current interface combination doesn't support P2P mode.
> 
> So change it for P2P mode.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37
> Tested-on: QCA2066 hw2.1 PCI WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.2
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

6 patches applied to ath-next branch of ath.git, thanks.

faedd6e0e139 wifi: ath11k: change interface combination for P2P mode
3a415daa3e8b wifi: ath11k: add P2P IE in beacon template
2408379f15a1 wifi: ath11k: implement handling of P2P NoA event
75b5f1e71abc wifi: ath11k: change WLAN_SCAN_PARAMS_MAX_IE_LEN from 256 to 512
6c7c30adf79e wifi: ath11k: change scan flag scan_f_filter_prb_req for QCA6390/WCN6855/QCA2066
f8c0799b2428 wifi: ath11k: advertise P2P dev support for QCA6390/WCN6855/QCA2066

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240228093537.25052-2-quic_kangyang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


