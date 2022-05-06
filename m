Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002CEC433F5
	for <ath11k@archiver.kernel.org>; Fri,  6 May 2022 06:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kn7dbnyEl2RNT5fM5gMhIDZMGlH/niaWum3J8GN/pq4=; b=C8v1yBQk7akP79
	jUHcr9ei7v6/8/Ls3/eSw7fOewN1AHP5lGzmb5AMwT5aS0PYX8YY33VHmcwzoubxnI35hh0qYr+ko
	Ro8eGpnDDoKTcJTlB7N31JOUZxCRk++GjGjJ8VjJ3VTLwZfSSH294mC34NTt0wPaQsDBfK09c4p7B
	BTIiuhBVQqvNLfTUs2LiTu77P5JM+uCbXUraSAc8zCDSoIR3nw/xwhgxYIHMcLx1oCeH7H49yWsKb
	nVRMoqpsg+Q7G2GTJaStvINrDquCKWrR4K5NkGtGuvzrCNzxjKbCxfFgRWyWsdOfD0XwQJqDoB/vK
	gnNLNdkq+DI/qe71/2SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmrKG-001Z6T-Bw; Fri, 06 May 2022 06:20:28 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmrKD-001Z4p-8x
 for ath11k@lists.infradead.org; Fri, 06 May 2022 06:20:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E114FB83334;
 Fri,  6 May 2022 06:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACE50C385AA;
 Fri,  6 May 2022 06:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651818022;
 bh=Uo/zEk3pxx6gI0ehxLl3UD9/wiP9AHOMLUlfmqW0YUQ=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=ipNyiIPzL8czMQVRZh/d0bU4+tf8sQmHQ1kD1Cnef1pl5b68MRp8Z3watliOY1hgw
 gd5755Ls6wMkCFNGizHb54k/jW7dAk7zIjBJ+jKnfWSP7EuEXD1X/Bx92lDlmSvVN+
 UsHIWyqCuXLxkidC9Gtwe9y3XfBOI4P4IPk5ySBWLJkCfyJc56/oY3PJNA4qPwICUp
 sBYoAsYK1b9S4kPPFa+URc2sqhejWI/iGitVYKWN94Du3MTUCLsOtKrd5O3dW5XqMa
 281jcSA2rBBPsvZdfSibzcj/c9sS/eXXG//cLLr4/Ht/nWntPbgYUt50efdFzxs8VZ
 5IJTGbxfRO1kw==
MIME-Version: 1.0
Subject: Re: [PATCH v4] ath11k: Fix RX de-fragmentation issue on WCN6750
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220504083900.31513-1-quic_mpubbise@quicinc.com>
References: <20220504083900.31513-1-quic_mpubbise@quicinc.com>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165181801572.13324.15375234945964628644.kvalo@kernel.org>
Date: Fri,  6 May 2022 06:20:21 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_232025_499367_3FE4BC68 
X-CRM114-Status: UNSURE (   8.06  )
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

> The offset of REO register where the RX fragment destination ring
> is configured is different in WCN6750 as compared to WCN6855.
> Due to this differnce in offsets, on WCN6750, fragment destination
> ring will be configured incorrectly, leading to RX fragments not
> getting delivered to the driver. Fix this by defining HW specific
> offsets for the REO MISC CTL register.
> 
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

22cc687326e0 ath11k: Fix RX de-fragmentation issue on WCN6750

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220504083900.31513-1-quic_mpubbise@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
