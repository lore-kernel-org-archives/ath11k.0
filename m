Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C1FC433F5
	for <ath11k@archiver.kernel.org>; Fri, 25 Mar 2022 10:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kdMBxCJMARYL3sjSTcZWvxk2NaotAJ9QJg09i5OLHaI=; b=iggn4azf0U1HPF
	z1BL/Kp1HAPP+h+iFFiK5cBZ1BYr68KNiLnGimWm433RgOT0o6Bt6GeoR/My9zVfQ9VlxXv+cpkJK
	jzEuYI4xOZK+v5tTbs73FxNevVlg/pJnyO/it/FW9xpJI73m3wKnQ9beklROKsSaJHCYs4uveyi+K
	O5EmlfK4V6dkjoW0RXQ8v8Bh9xhoM77/F+w1VIjFg7Ax3YWwNCnXIkaXq3gA5qHqpsjaLUGRJLQYA
	hv6653NVka+ESglKaZ9CDd1y6obkcIjWpCVTwIuHytRdcxNGRWYBX1IrD6Zqxb84kIXrOgEnyTdQ2
	v06AyxgMyt27wo2rejgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXhLK-001mRW-OO; Fri, 25 Mar 2022 10:38:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXhEQ-001jij-Ci
 for ath11k@lists.infradead.org; Fri, 25 Mar 2022 10:31:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D0348616B0;
 Fri, 25 Mar 2022 10:31:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46D44C340F0;
 Fri, 25 Mar 2022 10:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648204304;
 bh=EjVkXtA8bWYwusJ7cnkFZ2L4T3qiD5nWqRzmc3b8aFo=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=YjRXe6utk4e+5Pbr+48He5pXRe4KJKA3Z8ZOtnsD9V7aiRT6u6+saPdQtE8JmVACB
 Axko06qR4ouVedWMqRvQM4L4md/zOjJFO2/K56JWB2geTFEyl9k19Xc7B8WgUeeWH1
 FsUna5k3w52DfwVAwr6ezPcrZwvfEFQyyEcQ0z9RgeNPinECZhOy0KCo6tPcwbcWVr
 G6fIwgZzQvXwfEFt9ZUh0MQz4bgy1+TNhBGVRq3R0quZylcmRhNK8qPGcdC+409RZK
 +2Axf+h5Mkp9vmSSAmDVnaphOdjj4NmiXwsjijDQcqHlho8dVAU2ez6C8PzJLOvdyI
 OAeQettzwZNvw==
MIME-Version: 1.0
Subject: Re: [PATCH v5] ath11k: Add peer rhash table support
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <1644036628-5334-1-git-send-email-quic_periyasa@quicinc.com>
References: <1644036628-5334-1-git-send-email-quic_periyasa@quicinc.com>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164820430111.12637.15917942567266663243.kvalo@kernel.org>
Date: Fri, 25 Mar 2022 10:31:43 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_033146_532276_CDF43C7C 
X-CRM114-Status: UNSURE (   9.90  )
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
> Now     : ~860 Mbps
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01067-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

7b0c70d92a43 ath11k: Add peer rhash table support

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1644036628-5334-1-git-send-email-quic_periyasa@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
