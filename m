Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2596AFF886F
	for <ath11k@archiver.kernel.org>; Tue, 28 Apr 2026 07:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QTzlCsJxRzarVSCWMnV2DjTN1aJ/3SZ0E8/5kT1ecwo=; b=AL/ZB+1N6ClDlhPr1W5uRQCf3w
	kKC6bL3Kpqs1kvNE0qhryx9IvOy3HRAfQpTOy40Nw2linwLNCmBCrREtGEq4O1fkZN6MLiLew/CS7
	MVjRcjD2gUZBBSRRbQW3i2Aif0OFqjMQy+1HxKh4b5j1YdVmaLZ6rQt5iGmy9GVIWtrCkq6R1kdGA
	k3UG0Ii8qpCRe2LtdU3DSbekzFs8NWsroPAfHs7156j7MlZ4XeUcRqj3XVpiDyCFMAjIdt95RkorP
	QDvW0NfilN4Tys6KwsXeNpnaTPUvKzMPUKkhMoe3CHzJl59wWyLNVBpENMZAKuOCZ4uJchkDG8WhP
	odjA3JiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcjF-00000000gMB-3s9F;
	Tue, 28 Apr 2026 07:19:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcj7-00000000gHB-0IKP
	for ath11k@lists.infradead.org;
	Tue, 28 Apr 2026 07:19:26 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S7DhJP440970
	for <ath11k@lists.infradead.org>; Tue, 28 Apr 2026 07:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QTzlCsJxRzarVSCWMnV2DjTN1aJ/3SZ0E8/5kT1ecwo=; b=T+liJsDdoA04rsFe
	d53NbqK0ag/2MOtHRHOR06JUiexyDx2gBJ5vQqtxZBJFAdBI/V3oYTNJEeXy/vZI
	DSl8AGGZTcO6NpLiOJ9sBBn0LkETrNsW/iFF2sRC/gjj/vgw1CLXvr6Mj92FWUSl
	6RmbBQPMPtPzVWDL4AujiV155IXqI6pXhASR/WtM+gZ00W8FdgDVo04uk2q+8lFe
	61YhHvVvmFBRNs4abwzoHtNQtw5OxiZAX4n6opp+SU116rd9RTQNOMy0dfhyEWmC
	HiQtPP18TKr7bfpPMjKzMdA1LHHvaCeApk1eyWTUJWBWfKgIjdNdW8EwEnUipXhh
	SX4wEw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtac4369h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 28 Apr 2026 07:19:24 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35dacc40f92so11177175a91.2
        for <ath11k@lists.infradead.org>; Tue, 28 Apr 2026 00:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777360764; x=1777965564; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QTzlCsJxRzarVSCWMnV2DjTN1aJ/3SZ0E8/5kT1ecwo=;
        b=ZsPpqfZiPda/qtATg6YK+HdWjIKmT3C9ZIyi0inx4y9UgPDz9Q1Wrn3PcinFSmFRdP
         u4uPQ1mb8seS7I93KKe6RQCmICr+nsLXeLSwPvghUcGdmukTWzpbAOpZvdwfs1H2vER3
         BM1ZvepbFJ/S9Ensy40JEb+wQpv34o6XJ8LOr5ZEG7cZ8U8Hgf9NGRtMp3PNwfzltv8F
         IREJUdYSZF543z0RLPFwVoe60B7T5qQU0FbPWsih0+XS5XsbH71falyMQlFO+mJOIe60
         N0rKeH2aSwZKmNGA/c0CHgWug73h91tDtceYSW5PHKXCivC5HLM2CR0FGOwLOzqVuVJy
         Gzww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777360764; x=1777965564;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QTzlCsJxRzarVSCWMnV2DjTN1aJ/3SZ0E8/5kT1ecwo=;
        b=Kf+b3Y6VpBhIPuW0QC3HidbgRM5oIuO/KBpMk6DTt8CiBHx0kRGRMgJYd8v4BoXD3F
         Zeu0N8vCXwpiGy0OKlU1+rWLUkNqKGoW7+bo/Pz9Y03ijLjxaknavsi5eNgMoNFRaQji
         SAoRabhghqJaAlIqCOpLMjP/5qb1BFdtIS64E2+D3PKMe5TlFhQqhIfUHmGsEJOG1TrN
         GabiYKN6iGn50B80itJ6TK5IcXg4Zuda2kKma529PdP/IIJrj2M7Q5EQwrD/W9CZAyiW
         AcajV0pbZ2ux8zYwWg0/08oY2CDgtkS3FucZ1ukecbDstAveb+8NmHkMTZcHCXlFcbJN
         5JZQ==
X-Gm-Message-State: AOJu0YwWNT6H4vykSvLSZdKTX9USSzJnvKo1hNUOi2mGaDnlcXHOqE0X
	Y8DzILwuKUPNkQuNpKE1hhH7S/4E0iwkvSa2nKApFYrTw5u9Kp04KRsLwRTH2x1zce6XBYuzW3w
	wyiWbU/kIpPtKEbOUXnTKMPjmsr5l66/h0s9VK+LFVXe/4aMeljyzkw7XvYKjj/BK
X-Gm-Gg: AeBDiev6GStGPk49UJ9Bcps+3FPGUYNKUtpxkyrcVZf7Kebp0sa5OAtIfD0ETcSPgbv
	Sr/+EaeKmUkWlVoLy171FFRIRm1aKnF8tXaiVGXmkhHDAbu4OJCOuXp17esImRFutSSKpgYbc6H
	M/NJQLTMVatfsGKWennjxl0IKZE+hr2G5FLasb6ZxEkdu6F6Tjf2oGC3MbpzrF0fxCfepYEPoMG
	RKlph2BbfL973uJDaO8qfoPBp7yD88W7NWVYVkxJ0EGt6ehRrdf4MfxwQv6dD7t/BdehlnJsf3j
	ZdF/Xethbfp1RPo059fvB3/8/Q0RyfltwlKjAfU/CfFF0Z1MbeNIzPCwBSVxwWiJsstE1QAsKF4
	KllJ002TI0jrcYXNDHf/uoELpREO8quoayccKuzXgrspJUkZDnsJMa+4XpZNZzKvx6amuQS/B
X-Received: by 2002:a17:90b:2790:b0:364:6558:99bf with SMTP id 98e67ed59e1d1-3649202bd08mr2009823a91.14.1777360763766;
        Tue, 28 Apr 2026 00:19:23 -0700 (PDT)
X-Received: by 2002:a17:90b:2790:b0:364:6558:99bf with SMTP id 98e67ed59e1d1-3649202bd08mr2009551a91.14.1777360758856;
        Tue, 28 Apr 2026 00:19:18 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3649069c775sm894335a91.0.2026.04.28.00.19.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 00:19:18 -0700 (PDT)
Message-ID: <7d59bfa4-ea59-4527-ab5b-1e2350d08de7@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 12:49:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath11k: cancel SSR work items during PCI
 shutdown
To: Wei Zhang <wei.zhang@oss.qualcomm.com>, jeff.johnson@oss.qualcomm.com
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260404043050.3433754-1-wei.zhang@oss.qualcomm.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260404043050.3433754-1-wei.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DZmXtlPzpPxvUZXgNQ5SYYPqk7_vh1pw
X-Authority-Analysis: v=2.4 cv=D7J37PRj c=1 sm=1 tr=0 ts=69f05f7c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=G9A0gv2bhTP1aVYgofQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: DZmXtlPzpPxvUZXgNQ5SYYPqk7_vh1pw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA2NiBTYWx0ZWRfX/h+BlZou2/wH
 goWLgNBCOLWtzmQ6mVk1B3VD1WFq6LYMDy7+vcutn5qfsV9M/sQhC5NuXjzNSw5ljZJmx94bsZr
 PP+oo62xVjsNyai1aHDoLGcGSs0SCDzAQC4o4U1NV2/CwxWOWLJTV3mWvHK4D8KFTFtsqLKlKel
 G/wKQzZ2b+z1FnE4Ba7F6cPRJ3NXtxLCzLBR0yxxJUOa9RRkWELRDLE1MNf3wBlIVtrJM7CWejx
 CHf1epzpHN6mnkadmVEyVtYfdC1X3Y24FLoBFM8+cdlMoct4pDdL/XPgmwFTlJM7rMZzJ7FW+n7
 CgbtD/MMXku5nEHfcj5D4SolJFgDeS87mYp5HhK84Vyww+Ie/xofUIPMLoKje6mSOPIZe+xci3f
 SPex8qzjn/0uyap4RX7nkzVDQ1TYiE+cjF4YjcPCTKYkmvbrMRGZxwnEpw1OgrpBtCvgbwUOdwt
 1x6g42W30f7ix8dEEvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_001925_156286_93A4AA74 
X-CRM114-Status: GOOD (  15.27  )
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

On 4/4/2026 10:00 AM, Wei Zhang wrote:
> A reboot can crash the kernel if it overlaps with WLAN firmware crash
> recovery (SSR). The crash is a NULL pointer dereference in the MHI teardown
> path while freeing DMA-backed MHI contexts.
> 
> Simplified trace:
>    dma_free_attrs
>    mhi_deinit_dev_ctxt [mhi]
>    ath11k_pci_power_down [ath11k_pci]
>    ath11k_pci_shutdown [ath11k_pci]
>    device_shutdown
>    kernel_restart
> 
> On the host side, SSR is driven by the MHI RDDM callback, which queues
> reset_work to perform device recovery. reset_work power-cycles the device
> by calling ath11k_hif_power_down() followed by ath11k_hif_power_up(). The
> power-down phase deinitializes MHI and frees DMA resources.
> 
> Shutdown/reboot runs fully asynchronously with this RDDM-driven SSR
> recovery flow. As a result, the shutdown path
> (ath11k_pci_shutdown() -> ath11k_pci_power_down()) can race with the SSR
> recovery sequence.
> 
> Fix this by canceling SSR-related work items during PCI shutdown, marking
> the device as unregistering, and serializing the RDDM callback path that
> checks and queues reset_work. This ensures that no new SSR recovery work
> can be queued once teardown has started, and that any in-flight recovery
> work is fully synchronized before device power-down, preventing MHI
> teardown and DMA resource freeing from running more than once.
> 
> Note: This issue only affects PCI/MHI-based devices. AHB-based ath11k
> devices do not queue reset_work in normal SSR flows.
> 
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04866.5-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
> 
> Fixes: 13da397f884d ("ath11k: add support for device recovery for QCA6390/WCN6855")
> Fixes: 5edbb148bc57 ("wifi: ath11k: Add firmware coredump collection support")
> Signed-off-by: Wei Zhang <wei.zhang@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

