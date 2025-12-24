Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B809E78491
	for <ath11k@archiver.kernel.org>; Wed, 24 Dec 2025 21:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ha4eKRJIz/T1ZwOob3JaZe2/+i72Uxp3TMnMs1kyDmY=; b=YxnEQARQoJuPBZaipHu8sjo2Df
	9bpK8NQBLhibTGZrORflEBbMTk4Nf7BQLt+KCP1T0hU0r8KHtWjPMscqaRcGKxMV20mMMnGLCkjJ1
	/4vw6Tu0pqNmJQkfZSbx0qvV2JCg7hwkWbEpkxAVE+fspAdNhy2/9nSynf+5AqjTmQ0Atjije31Jt
	tKanJRnES7++3oZfov9WnoddueirVSItr3k9rWdbyF/APprMY4iaOkduyKl+wbcyik/mrGLxK6dbj
	yDAtUiN2A8bnH1kqb3o8WzND7EbiZ8HD2QhIoq1dVPpTnHr5xoKZTagGFZdRB3EXs6sie2ouQugBw
	iY1AO1Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYWiK-0000000HQf3-3u8a;
	Wed, 24 Dec 2025 21:48:12 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYWi6-0000000HQeP-0rum
	for ath11k@lists.infradead.org;
	Wed, 24 Dec 2025 21:48:11 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-4511f736011so4343381b6e.0
        for <ath11k@lists.infradead.org>; Wed, 24 Dec 2025 13:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766612876; x=1767217676; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ha4eKRJIz/T1ZwOob3JaZe2/+i72Uxp3TMnMs1kyDmY=;
        b=DADINCtiT4skUaUzUf3PwmXfHd0hZvyC0xmrL+xkPQfWOR0gC+E/ysutYgFnvcufvl
         34ZU6JHUQ5eu/h9GyHyByylJrqoncgoECENysntML+5HLr4Q+J0dWDeoyzPXOq7eukNy
         um4Zb/OYp/mMZMzeCF9lUi1GN8GaYGaGWkGCnDH93RM5nzRQoloApZWBXG4SWMQfQJx2
         72hVJ9x45yccOZMaf57zqqgQN95/xjQtr3jMsuuH6Lwsu9zn3T07kwJWewHdr8UUlLTw
         7OArwy8//pt+uYd6ZQ4O51Ap8HFh3xxDC0/1SgkHTTiC7YOoZRpUcTDmkttKG+nV9Hc6
         TfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766612876; x=1767217676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ha4eKRJIz/T1ZwOob3JaZe2/+i72Uxp3TMnMs1kyDmY=;
        b=CSqp5VFthlGZ5LqZpn4d1BlhHedaDQA16Jx/7Um2j8WXgCDWcgEdmJH5YIT5G7whNJ
         iXY1jqhXzMi2DpH7OKs3okV9pB4JrB0mzZU+fN9BE1HxKfdunttlcFFP0IKzBBfxli33
         QUTLtCyvkk3jK2z4TKJg2jl0dVseZ9OAzSep+Z2SK+Wb+oWRw5iwFYN1OwL7Rq3eMhVY
         qjFEc22eA1uoHTsbhxYQpWcxX2fMCIGHIFY3lP3/OUnXBYjUpaA8MFFtxwVd2p5jJK0P
         mNuP2LrsF3TFuqHFmiBAQRhFcDt3SK6zfCnPxrzqRvqFsbcZ28meKO7ka+8KWYJ6ROLG
         2Jgg==
X-Forwarded-Encrypted: i=1; AJvYcCW26GJF2LSs9xFTmZ0Zv9NKY9zhP3j7T49/+Vp64/nmB5zC885Uhrc98ARuwmsCMrERCgi9eiA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyGSJN6N5IKOjuo36fijhiKw53fqFX5bSkUugKl8FT3dMRZvKzx
	TWFFZLt7wqLCM3i3oh/CooU1uRMFluwVJfsepSF6OnKCNZnlgXzcZRfP
X-Gm-Gg: AY/fxX7vwclW3u36tAdu9pjRzf1hUDF+zm6iPk7vAaCgSnyk1RufvBW5Yp52qpbRcBP
	ZlWcAy6n5Pr3jFv1DELPN/y/PU5Lfnu7NVBPkB9iRfNw3XAFExdp2JepX1YEIzLF511Ky29k1ME
	+tKYSzrbP87CBckKJ8EoTaJNj+a7Zqo98RGSbCBRyRoyDzlRg+AIcMzqHdLJUaHa7Dbr7Qw6qKR
	YubtIHd/Hzd+ERqbHJGz8qnmauW6HWyM0t7I+uxiQAgbvxUtwjxuzQdDSl06buS7hza6uIZHTXF
	CGu1X2JdleEr++v7DMleVssm7Nd8BbqvM7JgGcyZlqWaP4yTYlm1Br2WsD9fhnQnOyZhsaZrV+7
	ord6TbX/QXMon1Y+OV/T0gLb3UfkMg+Njds0x0CnJ07c1yi0h8wjAr3L7FHCtuR84iYXX2kI1+k
	MaqemKPBy0MSKc+kllmvf7iYtKO7jhV+vWdZeZARlrfoNQK1IAFkETr9D2TJFD/FnbEUhxzukhv
	dwHa9jC16I3V/dhxwEUH1MgcZY6b9Q=
X-Google-Smtp-Source: AGHT+IGu5KZ4dsfgHYKgEBcNkgI5QWefcHhYRFFlHiYBwboCpljiSYdEgGO062vJLCxBROo3r+3vXw==
X-Received: by 2002:a05:6808:180e:b0:450:d4b5:3527 with SMTP id 5614622812f47-457a29567c4mr10023379b6e.24.1766612876310;
        Wed, 24 Dec 2025 13:47:56 -0800 (PST)
Received: from nukework.gtech (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cc667d4f62sm12176872a34.19.2025.12.24.13.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 13:47:55 -0800 (PST)
From: "Alex G." <mr.nuke.me@gmail.com>
To: jjohnson@kernel.org, ath11k@lists.infradead.org,
 Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
 Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH] wifi: ath11k: fix qmi memory allocation logic for CALDB region
Date: Wed, 24 Dec 2025 15:47:53 -0600
Message-ID: <884758381.0ifERbkFSE@nukework.gtech>
In-Reply-To: <7ef46837-7799-4ede-9f5e-88a010d5d1d4@oss.qualcomm.com>
References: <20251206175829.2573256-1-mr.nuke.me@gmail.com>
 <7ef46837-7799-4ede-9f5e-88a010d5d1d4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_134758_259534_E803058D 
X-CRM114-Status: GOOD (  18.71  )
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

On Monday, December 8, 2025 4:23:46 AM CST Baochen Qiang wrote:
> On 12/7/2025 1:58 AM, Alexandru Gagniuc wrote:
> > Memory region assignment in ath11k_qmi_assign_target_mem_chunk()
> > 
> > assumes that:
> >   1. firmware will make a HOST_DDR_REGION_TYPE request, and
> >   2. this request is processed before CALDB_MEM_REGION_TYPE
> > 
> > In this case CALDB_MEM_REGION_TYPE, can safely be assigned immediately
> > after the host region.
> > 
> > However, if the HOST_DDR_REGION_TYPE request is not made, or the
> > reserved-memory node is not present, then res.start and res.end are 0,
> > and host_ddr_sz remains uninitialized. The physical address should
> > fall back to ATH11K_QMI_CALDB_ADDRESS. That doesn't happen:
> > 
> > resource_size(&res) returns 1 for an empty resource, and thus the if
> > clause never takes the fallback path. ab->qmi.target_mem[idx].paddr
> > is assigned the uninitialized value of host_ddr_sz + 0 (res.start).
> > 
> > Use "if (res.end > res.start)" for the predicate, which correctly
> > falls back to ATH11K_QMI_CALDB_ADDRESS.

I am ready to submit the IPQ9574 support. This patch is a dependency. Should I 
include this change in the series that adds IPQ9574?

> In addition, does it make sense to do of_reserved_mem_region_to_resource()
> before the loop, which may give CALDB_MEM_REGION_TYPE a chance even
> HOST_DDR_REGION_TYPE request is not made?

I'm sorry that I initially missed this question. I don't think we should move 
&res initialization outside the loop. We also need host_ddr_sz to be 
initialized by a HOST_DDR_REGION_TYPE (1) request. On IPQ9574, the firmware 
doesn't make that request, so host_ddr_sz remains uninitialized. Since &res 
and host_ddr_sz are used together, I think it's better to initialize them, 
together.


Without patch:

    ath11k c000000.wifi: qmi firmware request memory request
    ath11k c000000.wifi: qmi mem seg type 4 size 409600
    ath11k c000000.wifi: qmi mem seg type 2 size 262144
    ath11k c000000.wifi: qmi mem seg type 3 size 1048576
    ...
    ath11k c000000.wifi: failed to assign qmi target memory: -5



With patch:

    ath11k c000000.wifi: qmi firmware request memory request
    ath11k c000000.wifi: qmi mem seg type 4 size 409600
    ath11k c000000.wifi: qmi mem seg type 2 size 262144
    ath11k c000000.wifi: qmi mem seg type 3 size 1048576
    ath11k c000000.wifi: qmi ignore invalid mem req type 3
    ath11k c000000.wifi: qmi req mem_seg[0] 0x000000004ba00000 409600 4
    ath11k c000000.wifi: qmi req mem_seg[1] 0x000000004b700000 262144 2


Tested on : WLAN.HK.2.9.0.1-01890-QCAHKSWPL_SILICONZ-1

Alex





