Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D125AC43602
	for <ath11k@archiver.kernel.org>; Tue, 30 Jun 2026 09:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e0z6v/3XR6OT9Ka0uNrvJzg5uwpb1hRYu/d4UpVlOv4=; b=Bntdu1DZLSX+q8iiiQFDUNuLNV
	DBa4OteYXLSdUWK5mY+MOK5Bqs9zwP0leysKmmxTcvuni5GrlaBTPkNOQnwGEHXCHxKPtHQ1U8//O
	MbK5sgyt0XU54vZPBe3vJZ77aHh6/QLFr9q2pm8ojVZILKvNwXl4bSjYC5kEtVou34o8mDaeOHany
	pDD/2rkHTjvxyIWeykHogYTz4e8qAW63zaTw/FZk1c/loYwKLrIWITUNwy3BlZeQa50PP+jhHONPj
	8OKYnApDijbxeeI7xhA/Qa9CJ56yJTdr1cK/3vclhG0cKJ1hx/N+5xevDcHrWbDTWDRFl4cZooDQa
	tOvrf7TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUzp-0000000GUGO-0do8;
	Tue, 30 Jun 2026 09:43:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUzl-0000000GUDx-1RNn
	for ath11k@lists.infradead.org;
	Tue, 30 Jun 2026 09:43:11 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6D2ag1097678
	for <ath11k@lists.infradead.org>; Tue, 30 Jun 2026 09:43:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e0z6v/3XR6OT9Ka0uNrvJzg5uwpb1hRYu/d4UpVlOv4=; b=PNleNZGSVmPM7rZP
	9sfZm+GQRNYfefjKUjpUh1iDvO+2jsv4LZeiiDQ4R0DD6vTR5RMGSlTw9FABAIsg
	lS+hE7Q5FIdRD2usKDwY5rxRNuy2iEokj4Xs+TIYadDHPxUpB2MmKkC5Dg82DGkH
	T3Bad+tatwGzW+AET9HPufoIe5KgMrzejkpS7/UM7LrYhRi4MjorYpvJ3FXjTphG
	KzpcqwYtOiANauZHVhP1uPDkNmF8IcZp8Z8ibdGT28K9whBWyqym0gnSllACCy3P
	RK/FWWA2PGCccsGFOzblUdYR4kPPbtoiHISnSRx9vRh1TMeUSeXnw3wdhbujDSZu
	FpQ6nQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f441gsvs8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 30 Jun 2026 09:43:07 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c98775daee6so1568204a12.1
        for <ath11k@lists.infradead.org>; Tue, 30 Jun 2026 02:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782812587; x=1783417387; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e0z6v/3XR6OT9Ka0uNrvJzg5uwpb1hRYu/d4UpVlOv4=;
        b=Wvt7A/CuCgvlNP564dXko+7J9O/AxW8NeRVbOyvzZ0pGgLsJQ6Ve7dW/oduSBV4NBi
         Vu4n+yb1qj14JGIzYmCGCeCOfAP6IRiEf6cot/QZNolClq2uflT+6bRKsGJILRsys9HS
         ITcHqVikgNvjKjf+PlqTmG+vFf8zhf65eL4D/+yiGE3J6QW6CA8JYHoAHiuNyNqIL06J
         QplVoQyM3ay1oH6ayUTG7LkxpZlgUwssU0KYJ4YicabX2tg/fmpFvo6vlwRv5+8L59Yy
         lLenZdYjRYrvhCLIDrWXY/iUYTDtZ9NNti2Q0oGje1cbT2DB0Hp3d7XsuAphkRpY2pQU
         k2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782812587; x=1783417387;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e0z6v/3XR6OT9Ka0uNrvJzg5uwpb1hRYu/d4UpVlOv4=;
        b=sUlYLSJ4mwPuFI5hL8J6q3Trb4IOSRRDCtZ2ziHNJZ1vy8yf5IiJyTM0JraXgN5KPJ
         f73BEY80b+3FbB4JiZP9gH34l95GL/vdUyB7DzdCckeUOqUv/UF9ipTmi1Xl9K5nhPSw
         8c733SA9ngAXQcOg9ZlBPNyARAXyt5XOoOC+bLIxG+H/0f2pyZ+o359jm9sFpB5PxfPq
         4bEzgD3bTayEVENkYMlByCvh1llwhkcrOJuk5AFa+aPgHJg1VvHNQuGjJxISkCe5/tOH
         1wF1zIXSHEZErLx/qdKDifGTgjnMEX7EAOXiDUFlJctws4lf8tNDHYUlg/VMsHJ5OsRu
         RHbA==
X-Forwarded-Encrypted: i=1; AFNElJ+eKu+Ac2uMkrIzmwAdSNG8SdNb9B6xsKfuMykFsI3PB4W1m8k1d6vv2txxu786yAn9OZysRlA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzxfF2abLZKH7Dr6JIgpxS+2eoM3GLiKQsZGJ+jX08IXsnXEMK0
	Dc/Oze3uYB05PAOSqK/czUiPq1geJR2z6w2NEEupejTBGPBzMrcQWrbDjEh9ipSi77IfmHoziHm
	OQ3FKrm8YYyrHpStG9G4+3LDTiyfXjf0er4nhuaMCCE34bfMm/LaFG8aIkwkLQsyO
X-Gm-Gg: AfdE7cm/sD5C7kc7P0MUWPCgSOAh+Ex/LFwOGuP67qX4uqv8AtJuytiLJfGAw9vn0aV
	4r5gEZbHJri1rBFuZ44bgRXSklYufeAWVaLge1p7LvbdAqet1SLLPn3xT4M8h5kls/eWwUWVnve
	fYzaGycJhzsFM5ttYTFQapZYwv9MKcLGq+kkssOjvGt91QC1qUUY7fEWZxRlx57bfJcNmHWWpS6
	JpyHwtP2S6PgDd5jakn9quTZgd12wNX4aIIQQRAJJeUXyjidz/CYZg1aRHAxmL/QpudwSCQ+56T
	GQNPqeo/IsGT3fJEznQKaN7gUR4eeBiDxo4hU0SopKryTwA2A9hCvYRj3PyOrOvFaDWDX6TdCni
	mSVIHQlIutvWBl09MD8DRMdK837gYdO2Uds4zEG0=
X-Received: by 2002:a05:6300:4047:b0:3bf:b6e3:fbe1 with SMTP id adf61e73a8af0-3bfc549e62amr2736301637.55.1782812587218;
        Tue, 30 Jun 2026 02:43:07 -0700 (PDT)
X-Received: by 2002:a05:6300:4047:b0:3bf:b6e3:fbe1 with SMTP id adf61e73a8af0-3bfc549e62amr2736273637.55.1782812586756;
        Tue, 30 Jun 2026 02:43:06 -0700 (PDT)
Received: from [10.152.196.198] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a002c995sm1549725b3a.24.2026.06.30.02.43.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 02:43:06 -0700 (PDT)
Message-ID: <01b3c5b2-bd31-4862-ad4b-ebabc29f57a1@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 15:13:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] wifi: ath12k: Flush the posted write after writing to
 PCIE_SOC_GLOBAL_RESET
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        mani@kernel.org, Alex Williamson <alex@shazbot.org>
References: <20260623141649.41087-1-manivannan.sadhasivam@oss.qualcomm.com>
 <20260623141649.41087-2-manivannan.sadhasivam@oss.qualcomm.com>
Content-Language: en-US
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
In-Reply-To: <20260623141649.41087-2-manivannan.sadhasivam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA4NyBTYWx0ZWRfX53TFO11P3cjy
 fPVnsK6F/sqWAS58AVBzRkMaeotKXvVMDwhvOVKgKpxq58bJlsqc18tIlQS8g765x/+gs2n+nhF
 MpA1CEp5S9/laJElKMB9oPg9EBbrY4Q=
X-Proofpoint-ORIG-GUID: i1LgDXc2RiwUZzr8yhuBjbLNMFAQj5Iv
X-Authority-Analysis: v=2.4 cv=F8dnsKhN c=1 sm=1 tr=0 ts=6a438fab cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=r1p2_3pzAAAA:8 a=EUspDBNiAAAA:8 a=-7ihF9cDai9aFXk1VuAA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=r_pkcD-q9-ctt7trBg_g:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA4NyBTYWx0ZWRfX6nMCbeJ/+mPa
 QkgesI7w5QKIcoxEvCGHj0sjoONau3MhOjyTdZNcBy1Qzl88VMmW65RSZcw55vFyXT/RYEjb96m
 //SobwNgj4LK2vtJ4IfYEIdfObT+AwounWpmh+hwIT6WG+g2wKI3QczBKD7pLZo3IlUmHrUPuWt
 KVe5tqPP8oj4dvsSIjzBCc5kKSGA+KxhMsXONYyCoSfpOj0jnECfZyC/CsNDSr6yOytcIixMwQg
 BZTXafDjjcXx24KHHqSwckCSGDBln/OZzV03VgRx24TR5jqado7Ms0oYuKRplytY4IODUGgYsDg
 s6LtSXSwdVrJl5I806GOcpP8RuL3wKVcp/vzcKXXgaklcc4Z/wzI3s43Kqxe1mi4mPND/U0C78A
 7Ymmrf0+zBCDNstP2UgPGkF3Db7OKcQ9AD7CBnfzCpbbYCjBbAz4+CCcVDcAcCIodGvF28WRHDm
 RIRg254NVq0peTZvajQ==
X-Proofpoint-GUID: i1LgDXc2RiwUZzr8yhuBjbLNMFAQj5Iv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1011
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_024309_392066_6964ABD8 
X-CRM114-Status: GOOD (  13.60  )
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

On 23-06-2026 19:46, Manivannan Sadhasivam wrote:
> ath12k_pci_soc_global_reset() tries to reset the device by writing to the
> PCIE_SOC_GLOBAL_RESET register. But it doesn't do a read-back to ensure
> that the write gets flushed to the device before the delay.
> 
> This may lead to the delay on the host to be insufficient, if the posted
> write doesn't reach the device before the delay.
> 
> So add a read-back after writing to the PCIE_SOC_GLOBAL_RESET register and
> before the delay.
> 
> Compile tested only.
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Reported-by: Alex Williamson<alex@shazbot.org>
> Closes:https://lore.kernel.org/linux-pci/20260622160822.09350246@shazbot.org
> Signed-off-by: Manivannan Sadhasivam<manivannan.sadhasivam@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath12k/pci.c | 4 ++++
>   1 file changed, 4 insertions(+)

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Tested-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>

Validated with 25+ successful ath12k and ath12k_wifi7 module reload
(rmmod/insmod) cycles on QCN9274.

-- 
Raj Bhagat

