Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A42C4345F
	for <ath11k@archiver.kernel.org>; Fri,  3 May 2024 13:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wY7UbpWjAWTm5QNBW9QVH3i+JsYK2j/f6WpkaSkrNmg=; b=YUW6Hx2z6n1b3VXu+CnAP4jen3
	/SzFbBbwL/L21FNaw0Gf9EK1yIs08lu+6tl6f1/xeZ1jXfIoqNV65HafQL+ZWJvVh4LPoQ+mkpzVV
	nHnzed7K2UAyvOGAemB0+sG0OrHkqsJqNELSIVmtkkyW6ojWiyIC9D3V/5SWadTql/EaAWPV0AQxC
	7te7ZNVMJ/NQaV0lvA9rN8qBkRw9zuzudK5jJCCVE3MHwwVS79vcImivjNzk2jbKkkCX1W4Y1tyKQ
	u0yLc4dFSrUKMuudBUU+JAbsPjvl8cZiK5tFJDObXDVA2RnhRkAGVCZiR3XHDAmMR7x0liI/54ryE
	W2Mr9yww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2scf-0000000Ga9Z-24Tc;
	Fri, 03 May 2024 13:06:45 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2scc-0000000Ga8u-0pr6
	for ath11k@lists.infradead.org;
	Fri, 03 May 2024 13:06:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4D48DCE186A
	for <ath11k@lists.infradead.org>; Fri,  3 May 2024 13:06:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C370C116B1;
	Fri,  3 May 2024 13:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714741596;
	bh=SRmvWzK8jEuViapsQ3ifsfszxPfXHhP+Zm1iIUVn/L8=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=qXRtC9GCbdwZ3q3o8uocC5py4noP3cw/quhHGzN71jDzKgyOgt20olICEGBQjgSgo
	 BYPZo7Rw7MzcmIEmF6iWCCah7YDbaA++jWmKdkRr0X4EbLbm5PNw2kKtp9UytOCabP
	 9PoPHyK5KiVmVH5jvvO1m+PdDI6brS0sJ8HOGwuFQcaeaqO0/Ieyrcg3ZHK9ERIiRT
	 7NspTzUW5tjw+vF4kis0aJKwVg+uhgq4zZxFdDi/hJgxLilWtbSle1P1HzDgtuzWL7
	 gvK199Z3xIGpUEklsgjdy08BeZGgSjuZN8LdvB5bJnXr2GR/rteqSLBs7/85I7N++l
	 wYvsjYr2Rytqw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/2] wifi: ath11k: ath11k_mac_op_ipv6_changed(): use
 list_for_each_entry()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240411165516.4070649-3-kvalo@kernel.org>
References: <20240411165516.4070649-3-kvalo@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171474159354.1512332.8542536125854078524.kvalo@kernel.org>
Date: Fri,  3 May 2024 13:06:35 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_060642_530990_1362C7D6 
X-CRM114-Status: UNSURE (   3.98  )
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

Kalle Valo <kvalo@kernel.org> wrote:

> Simplify the loop by using list_for_each_entry(). No functional changes.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

f41c7cab8727 wifi: ath11k: ath11k_mac_op_ipv6_changed(): use list_for_each_entry()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240411165516.4070649-3-kvalo@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


