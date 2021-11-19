Return-Path: <SRS0=20C1=QG=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C1C5C433F5
	for <ath11k@archiver.kernel.org>; Fri, 19 Nov 2021 13:51:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2ED5861247
	for <ath11k@archiver.kernel.org>; Fri, 19 Nov 2021 13:51:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2ED5861247
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=narfation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X3+4esQkiQ4BKZnNgdR3ag7zR0zNFHNkhdV6yhDOxcc=; b=S58lSXERz/riFI
	AxDpBKWhW8HNHd36C0NcE+NgV+H3qsFtNb4Mx1S4zHxWGy+2ovn3KoLyhU7bauYbDmfq2vuZKhnZ7
	6hKcUwT8Xm0z689PTos+jpOTPyoMIQSuM0YuaM3SrEJ3AVkqVop03ye3gdbXKfpUZkYMbGGymIW2t
	Fb91bxbBPHFYGNLt+IT6BbYJ9LOXYkTUXbkM1IUIm+6EIYMk+lwzqzGWvEwDBXiH49VnnNjNt35E9
	fTZ8D57FD9PttX6JxIaGSguLavDm1qcuPb8vkf5gKI3pDv57OSfT0uMuhKWP7Bl0krKnrqar3bRND
	NMFc9jhoEOUO/PVluWnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo4Ii-00Aa00-Mx; Fri, 19 Nov 2021 13:51:36 +0000
Received: from dvalin.narfation.org ([213.160.73.56])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo4If-00AZyv-Nh
 for ath11k@lists.infradead.org; Fri, 19 Nov 2021 13:51:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1637329888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gbObE9ucGPXTlt67EJ6vFWsn9MjX4s/zPYYmj7eYKSM=;
 b=rGchiJcmaMzPocBsBJ2kmggvW3JPwWupjAHWrT+qwgRVasYjajj1zcjc4BaYBFyhL98Mb0
 t+hY9y5tGhuHFW094XCMQooEB7KIf3HYzcXbkvU7uBne0s15lhzEA3jFGOPWANx3N3FhRV
 Th1Iwef5DL+J/AB3NfhSFx9picjCM4Q=
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 Anilkumar Kolli <akolli@codeaurora.org>
Subject: Re: [PATCH v2 2/2] ath11k: Use reserved host DDR addresses from DT
 for PCI devices
Date: Fri, 19 Nov 2021 14:51:25 +0100
Message-ID: <8643453.gy25EnUU4W@sven-l14>
In-Reply-To: <1637082058-6398-2-git-send-email-akolli@codeaurora.org>
References: <1637082058-6398-1-git-send-email-akolli@codeaurora.org>
 <1637082058-6398-2-git-send-email-akolli@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_055134_107929_11A5AA15 
X-CRM114-Status: GOOD (  13.21  )
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

On Tuesday, 16 November 2021 18:00:58 CET Anilkumar Kolli wrote:
[...]
> @@ -1866,10 +1867,62 @@ static int ath11k_qmi_alloc_target_mem_chunk(struct ath11k_base *ab)
>  
>  static int ath11k_qmi_assign_target_mem_chunk(struct ath11k_base *ab)
>  {
> -	int i, idx;
> +	struct device *dev = ab->dev;
> +	struct device_node *hremote_node = NULL;
> +	phandle hremote_phandle;
> +	int i, idx, len, sw, aw, host_ddr_sz;
> +	u32 *reg, *reg_end;
> +	u64 start, size;
>  
>  	for (i = 0, idx = 0; i < ab->qmi.mem_seg_count; i++) {
>  		switch (ab->qmi.target_mem[i].type) {
> +		case HOST_DDR_REGION_TYPE:
> +			if (of_property_read_u32(dev->of_node, "memory-region",
> +						 &hremote_phandle)) {
> +				ath11k_dbg(ab, ATH11K_DBG_QMI,
> +					   "qmi fail to get hremote phandle\n");
> +				return 0;
> +			}
> +
> +			hremote_node = of_find_node_by_phandle(hremote_phandle);
> +			if (!hremote_node) {
> +				ath11k_dbg(ab, ATH11K_DBG_QMI,
> +					   "qmi fail to get hremote_node\n");
> +				return 0;
> +			}
> +

Why aren't you using something like of_address_to_resource? Or some other 
__of_get_address related function.

> +			aw = of_n_addr_cells(hremote_node);
> +			sw = of_n_size_cells(hremote_node);
> +
> +			reg = (unsigned int *)of_get_property(hremote_node, "reg", &len);
> +			if (!reg) {
> +				ath11k_dbg(ab, ATH11K_DBG_QMI,
> +					   "qmi fail to get reg from hremote\n");
> +				return 0;
> +			}
> +
> +			reg_end = reg + len / (aw * sw);

Why are you multiplying aw with sw? And why are you then dividing len by it?

1. if you calculate (u32 *)x + 1 then then you would increase the address by 4 bytes.
2. for each address + size pair you would have (aw + sw) * 4 bytes
3. len is in bytes

So if you want to get the first byte after a full u32 reg buffer then it would be:

    reg + len / sizeof(u32);

If you would want to get the amount of full address+size pairs

    len / sizeof(u32) / (aw + sw)


> +
> +			do {
> +				start = of_read_number(reg, aw);
> +				reg += aw;
> +				size = of_read_number(reg, sw);
> +				reg += sw;
> +			} while (reg < reg_end);

What are you trying to achieve with this loop?

Kind regards,
	Sven



-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
