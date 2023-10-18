Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B6CFCDB47E
	for <ath11k@archiver.kernel.org>; Wed, 18 Oct 2023 08:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=apLuebE+T38N5NrQ+I2lhWRfY5pCRyTBXaNDydr0vac=; b=IQYbWHHbKZvJtV
	qnZnJXPkFl/YsyVA+HLd+0VwxGsNA3JoWmWG7aKoj5D0HeoyT3Mj4tJ43v2TggtkS3XKmnpOGhLSr
	LiigHEMB08+JKOrxCfCsTyEoMfMpHa71q6AgL5bKxlP6Fb1p83fi05Mq+DVtvMrjOV2lfjokv03qg
	uxR1o2aDrnsq+LqnmS2zFHhhqu08gQicO07X6I4J552vLnBlKXJ2T7XgqquKWBMF9tdcOHvsl0LWU
	SXifi015UbtqPUXfE15l5fKJojTkB0p8qDzSuNgOUteABy5HuwdGWxH5vb2GNFJlx3jKLmdzDMenW
	HHvIUwiSgCRQQG6cOKxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt20O-00EAAi-0V;
	Wed, 18 Oct 2023 08:34:16 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt20L-00EAA8-3B
	for ath11k@lists.infradead.org;
	Wed, 18 Oct 2023 08:34:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2C6E3CE2394;
	Wed, 18 Oct 2023 08:34:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E5DFC433C8;
	Wed, 18 Oct 2023 08:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697618051;
	bh=ItZbsx5rjZBBJaips/za6Qp1TpT1tQ6Gk+GqI7+4Qyc=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=C7N6mjYPnSzXbJuLTvu34JS8I1dAhDXlI8DFnQ8NVEXru3dLfK95GlRV6fV259JRR
	 wcCZ2Tw1zXxOcqzMXrpjykpDFl1olNuzWtDzJYEkYCBL78X0v367vGI7R5OIHx5o8g
	 Bowj8/gTtS+3ynbxurwhVVybRjpUAEyFASWLUsaKlBXYgKd2fmdb8GVKul3cqR/4Dl
	 5id321FZ4fp9P72w+E7y1LcjLJ3FVO+JzL9DeLHyLYRMpUlzpVoRLfPe1VyKb1XhVc
	 bG6uJ4Ob2B42vFenE7nTiU+tw7zI1I1u4gBGqTR5pWpkC8u+PB20pjZg+m/Tzr0PZa
	 2SPAJ0yob0WSA==
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] wifi: ath11k: rename the wmi_sc naming convention to
 wmi_ab
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231014032650.32605-2-quic_periyasa@quicinc.com>
References: <20231014032650.32605-2-quic_periyasa@quicinc.com>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169761804880.48072.5715328837742123686.kvalo@kernel.org>
Date: Wed, 18 Oct 2023 08:34:10 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_013414_200046_4BAF1626 
X-CRM114-Status: UNSURE (   6.97  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Karthikeyan Periyasamy <quic_periyasa@quicinc.com> wrote:

> In WMI layer module, the identifier wmi_sc is used to represent
> an instance of ath11k_wmi_base structure. However, within ath11k,
> the convention is to use "ab" to represent an SoC "base" struct.
> So change the all instances of wmi_sc to wmi_ab.
> 
> Compile tested only.
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

265c038ac9c2 wifi: ath11k: rename the wmi_sc naming convention to wmi_ab
2e66190e0d87 wifi: ath11k: rename the sc naming convention to ab

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231014032650.32605-2-quic_periyasa@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
