Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CBEC433F5
	for <ath11k@archiver.kernel.org>; Mon, 10 Oct 2022 18:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fPEC+Je0h9lJZoy7P/N7u+4WV1UfW9ZgdOym8HigMX4=; b=PMn1Q0ijyzFPbp
	kmG/cN2fNleK4YOr6dj9HSDZMolLSva8TYC+N8IVGB6QCMYI/RjiFpaRWvkfmMW3D61l/m6YLa8gv
	Uaau+friSla5Y+e0ZtdJYpZr26aBBz7SOFbrRnQ07LLzY4XqRzrR46rnd9xksaPqThQiu79XZXcur
	BXKtOJF3CZ3xRu7YDUNU2pZ4LGrPjuR45ghgtEOCkfmSft576qsOk5rv1fHdepHj4iTKJsJ+da+ue
	9NEtp/YI2BTST4Tr1sv8RekjjhHtG8rf+tCIShkp9b0MzkPabaJygityntPu0Lbv+rmPGFy4ohUGV
	jfCge1S2jqsw55Tg1cXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohxDf-001lln-KT; Mon, 10 Oct 2022 18:09:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohxDc-001lkt-Ue
	for ath11k@lists.infradead.org; Mon, 10 Oct 2022 18:09:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 342EE60B20;
	Mon, 10 Oct 2022 18:09:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E186C433B5;
	Mon, 10 Oct 2022 18:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665425374;
	bh=RKRZiw0NyczwHRdkeUVJ3EXEp69C4Pd8hlq2i0tQgjs=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=kNOxzz4WOuJ+CdKRPbUq4cdn2GCElTBzISphZnEXTh+QOiuvh/E9Aeen5tDB2PRPv
	 kRd2wJbVfjQCSXX0q0mrkIQS+ehvsJJIy7pXuLv6cr1EWeGKUvb368PkMOaTMZHmUI
	 rlOWiszLc+dA5eD91gJUm8D2KMJEx1mqGyPGEY/GpU5ViP63ukrB91ZdHNTqY1ERve
	 k78ZH5tq5RAp9b4A4djiWfCJKtASMaSyWfhmREO0OaYwiLKhLECWly2JuaD2ekSa4o
	 2YaF1zJQHnIpH+ZcRy5/S8Uw9oTgDAK2+DpK4OikmcfgYAAtcXZYpmFjPq6tgKKvDS
	 Mw8Pj9K8EV1zw==
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] wifi: ath11k: change to set 11d state instead of
 start
 11d scan while disconnect
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220928081413.27339-2-quic_wgong@quicinc.com>
References: <20220928081413.27339-2-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166542536986.511.1244496445875563981.kvalo@kernel.org>
Date: Mon, 10 Oct 2022 18:09:33 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_110937_055909_D02451D5 
X-CRM114-Status: GOOD (  13.40  )
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

Wen Gong <quic_wgong@quicinc.com> wrote:

> When switch to connect to a new AP for station which is already connected
> to an AP, the time cost is too long, it arrives 10 seconds.
> 
> The reason is when switch connection, disconnect operation happened on
> the 1st AP, then 11d scan start command sent to firmware, and then a
> new hw scan arrived for the 2nd AP. The 11d scan is running at this
> moment, so the hw scan can not start immediately, it needs to wait
> the 11d scan finished, it increased the time cost of switch AP and
> even happened scan fail as log below after apply the incoming patch.
> 
> [ 1194.815104] ath11k_pci 0000:06:00.0: failed to start hw scan: -110
> [ 1196.864157] ath11k_pci 0000:06:00.0: failed to start hw scan: -110
> [ 1198.911926] ath11k_pci 0000:06:00.0: failed to start hw scan: -110
> 
> Change to set 11d state while disconnect, and the 11d scan will be
> started after the new hw scan in ath11k_mac_op_hw_scan(). Then the
> time cost of switching AP is small and not happened scan fail.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
> 
> Fixes: 9dcf6808b253 ("ath11k: add 11d scan offload support")
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

I still see warnings:

[ 3627.691737] ath11k_pci 0000:06:00.0: failed to start hw scan: -110
[ 3715.435608] ath11k_pci 0000:06:00.0: failed to start hw scan: -110
[ 3860.333214] ath11k_pci 0000:06:00.0: failed to start hw scan: -110
[ 4542.000955] ath11k_pci 0000:06:00.0: failed to start hw scan: -110
[ 4604.018451] ath11k_pci 0000:06:00.0: failed to start hw scan: -110

2 patches set to Changes Requested.

12991768 [v2,1/2] wifi: ath11k: change to set 11d state instead of start 11d scan while disconnect
12991769 [v2,2/2] wifi: ath11k: reduce the timeout value back for hw scan from 10 seconds to 1 second

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220928081413.27339-2-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
