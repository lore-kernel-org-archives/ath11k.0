Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05A7C433EF
	for <ath11k@archiver.kernel.org>; Fri, 28 Jan 2022 13:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1x5zu3vkpqqktJEmg9xY01zIYwGwtuY9VDZULKijkD8=; b=DemnFQ+DxieeDz
	1NwAVMbWdcn51Lq7/zLEG1/LG8S3wovhMT01YrnXUFgoUR2n3A6TtY+AcFztOnRQ4M2qdlYVRrlCq
	CMjM49eIWtIijAXxk67wUOh1+nvA/hsjI++pLDzBn3xlZ/vaJvmTt47tghpji7YugJBL+J8cOe0Lw
	zpk9QfF0KznXxPrE0LE7S3rjRExhX5KH1deGZ01kGrJHPKbUod3TQ2bOEpaJ6oeQaMOwPXhcYTmIM
	jLTQf3GmmSXtLtYrruHf1kz79xvUSJb83gSi4c2XeU91+9D/CHAcQFO0pgRVgXqxa1kM+k3+OLkxW
	qgbvTKlq6DBXhwHXd2/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDRP6-002M1l-A5; Fri, 28 Jan 2022 13:35:04 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDQx2-002AuW-Uv
 for ath11k@lists.infradead.org; Fri, 28 Jan 2022 13:06:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7DD63B82571;
 Fri, 28 Jan 2022 13:06:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41BD6C340E0;
 Fri, 28 Jan 2022 13:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643375162;
 bh=YLdCeRRAO7aC5upx7PDW5LyeDkyTbwukVgcbaGW2FDk=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=mBFs3rp27b5sM9qp0wLW38fp9ZRpqcZxlaVYQBS2288G40Gytz1kcN68SyxVMJsdh
 8OsVUHbqX5DT/6hBYV6q7T6XX96J3GumboVI4i3/BywOZe1wEo7RXToTbaUHQLTtDC
 /iDRnei2CK9oIRB4cv7UUD9ZUNW7koMrS09k9twuY8CiRebu9UK8fTbCFWGm2nFIc5
 n+YWtsl7v+LcAsf+lqaQ3yW8MGkjE3RCwIWd3QwCnLf5rRnCbFKOok77qm4YY/NJSA
 vnnn2yjNMWlH2lPPctBPLUq0kUayGxj75qtGNmq22oSkEjupHseGma7w7aS1fLvWEP
 cCo+Ficn97sCQ==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Add peer rhash table support
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <1640248077-14075-1-git-send-email-quic_periyasa@quicinc.com>
References: <1640248077-14075-1-git-send-email-quic_periyasa@quicinc.com>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164337515701.4850.13179705947072575386.kvalo@kernel.org>
Date: Fri, 28 Jan 2022 13:06:01 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_050605_191902_39EEBBDB 
X-CRM114-Status: UNSURE (   9.18  )
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

> When more clients (128) are connected, the UL data traffic
> KPI measurement is low compared to single client. This issue
> is due to more CPU cycles spent on the peer lookup operation
> with more clients. So reduce the peer lookup operation by
> modifying the linear based lookup operation into the rhash
> based lookup operation. This improve the peak throughput
> measurement. Since this is a software algorithm change, it is
> applicable for all the platforms.
> 
> TCP UL 128 Clients test case Observation (64bit system):
> Previous: ~550 Mbps
> Now	: ~860 Mbps
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01067-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

Fails to apply, please rebase.

error: patch failed: drivers/net/wireless/ath/ath11k/mac.c:4524
error: drivers/net/wireless/ath/ath11k/mac.c: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1640248077-14075-1-git-send-email-quic_periyasa@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
