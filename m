Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 840CCC433F5
	for <ath11k@archiver.kernel.org>; Tue,  5 Apr 2022 08:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3lFhIqltWyjjUgw7YQr5/uWgffoqMKL6IlsTB+Bg7LE=; b=k5pdQVK775jYGG
	LwRkpMQx/Y8YPETkWKJXUw4VHgLMck56wHVRCYc/qPYRsIt9jee/4riGqqDaU1i64bb6wI7KMKExi
	fEsQoZ2fM2t5y3sj8dNG30m7ln41Dk7m19tjCMYyQdPo4BB94hE0ZWfe8X/f2ozNfhG5D5eCzbDP4
	SVy/ZA2+qYxmM/bUXEcW41wKtEgy4t9duBVMqoaGuuhbVwuR+2wu8N5mqL4odnNEWL/r4GHxdbXIS
	u3WuES9L3Hn9N8tBY+K2t8XArzvw1c1WQQIpf3CCG6rGhNoPXbc4K1LPqjphKt4lKV73VG/v0kWqt
	26pMY96mhTsnnkb57XSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbeDc-0008uw-Vm; Tue, 05 Apr 2022 08:07:17 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbeDa-0008ts-6w
 for ath11k@lists.infradead.org; Tue, 05 Apr 2022 08:07:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D1D9BB81BB6;
 Tue,  5 Apr 2022 08:07:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91F64C385A3;
 Tue,  5 Apr 2022 08:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649146032;
 bh=XIDDvt1ftw2GOb3RkcuJpSwO8lvCv8diT65itEWJWmw=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=NbV3g6fVVH04VzcmTLZbQajhr1aGT8QvHyjPqI2PuhRhoKBwFqBLl8YZgb5Zegsqh
 BjBiffb3Z/ve42oKYVdtcKkkpDlkYVwJ9mVcvAOD7zJizSZgzwNGrKJP8QF5506wE1
 moOvUG0+mYZjZxK3sCMykvGzFJ1whpWiC/PihDQ+X6gSpMaFYWXP2C5xWq/gVFykui
 QF1Z/PfbtPmSymdCPhxX05XTziKLGFd2ZzOFSa9Sz0YHL91VB2hwRat4ky7sGW7aEx
 OGTAbtHCDbmLL1cp8ICblJe6S3xxymmdmdIOMxAz3j1z4tYXFaSgdiEOESMJMPJ6qG
 MdDi3NKrPT+dQ==
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/5] ath11k: PCI changes to support WCN6750
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220328055714.6449-2-quic_mpubbise@quicinc.com>
References: <20220328055714.6449-2-quic_mpubbise@quicinc.com>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164914602727.12306.5327755878544147353.kvalo@kernel.org>
Date: Tue,  5 Apr 2022 08:07:11 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_010714_515906_8BC9813D 
X-CRM114-Status: UNSURE (   9.43  )
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

Manikanta Pubbisetty <quic_mpubbise@quicinc.com> wrote:

> In order to add the support for WCN6750 in ATH11K , it is
> required to move certain PCI definitions to the header file.
> As a result, add ATH11K_PCI_* prefix to these definitions.
> 
> Also, change the scope of certain PCI APIs that are required
> to enable WCN6750 from static to global.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

5 patches applied to ath-next branch of ath.git, thanks.

948171b5f6fc ath11k: PCI changes to support WCN6750
bbfdc5a751a6 ath11k: Refactor PCI code to support WCN6750
8d06b8023ace ath11k: Choose MSI config based on HW revision
0cfaf2243e9e ath11k: Refactor MSI logic to support WCN6750
5b32b6dd9663 ath11k: Remove core PCI references from PCI common code

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220328055714.6449-2-quic_mpubbise@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
