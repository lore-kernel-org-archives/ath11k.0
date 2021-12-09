Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9096FC433F5
	for <ath11k@archiver.kernel.org>; Thu,  9 Dec 2021 16:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bsMpl+Y/Lgi/A83RfJmf4bLrRDFql9sIvDOYy7c0m20=; b=Xn/LczeD97aeFh
	V0kWuxfygZspmMA8LgUTXIhvHGdeeFnaO0wlGAZtGHnIqFCVZxKk6+z+vDjAAabQgToBGQdtowcv8
	IZQF8rYcY5vby7QXXZ159qffpNWYYwGB2i3xMB/x8VN/JoQurJSmrAkvfGUUwOdwB/nfePV80/wiP
	C7E99AqWSSRVq3iP4upD2PurObZqF/x21TlPRmvhmSrTKgJiL3zmp+bLMnKhka0xNtseWysc06uEH
	TpXiZzIxfV5ruLFC8xVzU+FUbJga6z4e2fZtQKn9UNBt9FyS9mdIqfuK12bxEkvRHSDEvQBl7G5SR
	+BbXkMGlxZN5H/3wTJsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvLxF-00GdUM-KB; Thu, 09 Dec 2021 16:07:33 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvLxC-00GdTW-JQ
 for ath11k@lists.infradead.org; Thu, 09 Dec 2021 16:07:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 52228B8254C;
 Thu,  9 Dec 2021 16:07:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F994C004DD;
 Thu,  9 Dec 2021 16:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639066049;
 bh=QCfB1mvMTh0V1PcUo+MWU8dN62cEufkqQVYOA2m8uvk=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=H6mi4U+guBFBGURzaZS3BNm2ESfqf1fik/rYmMuSMK6CRfcqatu/kCM4BzYDqgb1Y
 dUNrB6T8lIwxUIC7sS1i1+gdzMf/cv1SVpuP9yVQsST8NMyRAc2G7i7Z9kJkKVD9dm
 5N8fKA875JCIxh68RFo8OijNwkL35XSrG/+ToBFxUl51OnZCLHrRdqeWVu0KvcOLMw
 cupF2e/t/fy1YQzVyqh4NR6wwMWRaRYhk4XPZ0A7UbGsx5sZkIyxTYWwbGAD6odyAA
 67stpxAdfpppqHlCBY0lQuU7zXruiKJWmf8laXboWoz+f8ESKpHyHV8o+G0iGQFbNb
 eC61Te9ZtRqjA==
From: Kalle Valo <kvalo@kernel.org>
To: Carl Huang <cjhuang@codeaurora.org>
Cc: ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [PATCH 5/6] ath11k: support ARP and NS offload
References: <20211011193750.4891-1-cjhuang@codeaurora.org>
 <20211011193750.4891-6-cjhuang@codeaurora.org>
Date: Thu, 09 Dec 2021 18:07:26 +0200
In-Reply-To: <20211011193750.4891-6-cjhuang@codeaurora.org> (Carl Huang's
 message of "Mon, 11 Oct 2021 15:37:49 -0400")
Message-ID: <87h7bhyd6p.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_080730_795779_5950AEED 
X-CRM114-Status: GOOD (  10.33  )
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

Carl Huang <cjhuang@codeaurora.org> writes:

> Support ARP and NS offload in WoW state.
>
> Tested this way: put machineA with QCA6390 to WoW state,
> ping/ping6 machineA from another machineB, check sniffer to see
> any ARP response and Neighbour advertisement from machineA.
>
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
>
> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
> Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>

[...]

> +static int ath11k_wow_protocol_offload(struct ath11k *ar, bool enable)
> +{
> +	int ret;
> +
> +	ret = ath11k_wow_arp_ns_offload(ar, enable);
> +
> +	return ret;

For consistency, please add error handling for
ath11k_wow_arp_ns_offload().

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
