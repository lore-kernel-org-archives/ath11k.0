Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DBDEFB7ED
	for <ath11k@archiver.kernel.org>; Tue, 24 Feb 2026 02:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PMJp2dBVtqdUWCHncCX+tIj1sCsocWtenX7q64eQopk=; b=FcVK3NNqK0YzxiBM7vwlle1fn4
	pZHiAqXvZHft/Hy6FZxnQNw113uWV0Od4WLuBEItA1r7BQDVuz9s+fGZi8Aqmkx6sodkKiJ5z/3rk
	N96lr7qcS7HK9rKFg5gNlTnClEu8v2poQOZ2H29O8wLwtKrqPCJA4OGbf+oa52I2g6r6adRSpzm/d
	FM2K+I7zBEz0o7mB4XnmMEdKGUUHUcA/ZkgVlKWYWLjhxqJIWOddYrz9UF7eKxM6Kug2wSxKZOcnb
	M+JpJTwOg4fZL+JJY1NzCiTBCKgOp30ZUorh7VzBKMfVIs8lAZYt0bgk70tCW2bcckfEkXywJq6Cd
	wZL5cU9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuiWr-00000001NRE-24Xw;
	Tue, 24 Feb 2026 02:52:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuiWo-00000001NQs-0OQp
	for ath11k@lists.infradead.org;
	Tue, 24 Feb 2026 02:52:03 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O2m2Ce2119824
	for <ath11k@lists.infradead.org>; Tue, 24 Feb 2026 02:52:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PMJp2dBVtqdUWCHncCX+tIj1sCsocWtenX7q64eQopk=; b=igbFCKoz30Xci/cW
	bs/R2HNQ+IwXCJIpslVh16nsZ9+x69s3ZxaZY0CefdA/DEQdy6CaSYwpBM+xObYd
	f/VCn2owWQYvK/4L6FqN1esG+O5YZjC44PXNAHY8cFNJygAZDZNCqlVFbKAgv7AA
	455tdyxyzBx9GJmvR4B5vbEQNmJyaFRZlNsi1P4yVZdLVbu8bcZRo5HkQRoVBo7l
	l1Pd4KKj6BJoEXwoRv7OcYPuyqtTRfA8kMkaVNrkyc36fr4R5MpmmJ3QPBOXL2if
	LQVEcCdv1t9Tj2bvLdzmPTmJ6a+rQsBDaYGC9tgLRnU5+stB2b1G6QSs2f5lySO9
	9QxzbQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgtyj9f3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 24 Feb 2026 02:52:01 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a7a98ba326so74839995ad.1
        for <ath11k@lists.infradead.org>; Mon, 23 Feb 2026 18:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771901520; x=1772506320; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PMJp2dBVtqdUWCHncCX+tIj1sCsocWtenX7q64eQopk=;
        b=TwPMj8CncyCdTo6Z75pPsywampOaDq0mwEyrYnvZ/DKGBqz9FC50DEm9FH5lYs5snW
         AFnyXwAgpNYMfMNFXqSekIm/aaHWZpigIbE8or/2wfr7qp4T6w8hC1+btc7AJVXYCdOc
         ZYXMfRTJYRybU5fduvkJp+5XGlFxAk0UTc1vq6ml4mTcWcuJc+0tKxT9TzYIOuo26QDn
         IlXMJJzv0A2IRmUgQrcBexuldAMdF9hOrfXKjqkcVxfIPd9xrh3elraSZzwy5YM+Pb6z
         dkJcpnhIFJJB2AG0H40gd03rlq3+XH3jcP/OGkxL8y+wR8/QlB0rb2osK59gwuD8v42x
         iBvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771901520; x=1772506320;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PMJp2dBVtqdUWCHncCX+tIj1sCsocWtenX7q64eQopk=;
        b=uokj/xJZ2e6iyQs/UBqRhGtkLD6sMtPqUKi8eveVU0g9bIv0iF0vUrgyo3Dg3SBvEK
         zCo4pdoOpLSzA/6H/OL3H70XdCigsSaSAr3n1sczDd1Zelxq/yc0m0JA/EhIsc/8nJey
         QQDo2h5t3/nDcRn/Ffp2G2/vuyLyIPbSMyJpWwOct2HGZ2EbDYv0QSXvm8knplLlTolw
         UG1o9XR0rMygBvGDIxR5rzojCog1B6N8z6nyt5waOlipwwzTIuiByUVREpYwHrWpw451
         oUf8as9ho/Q0jWdsjaxV9mk9OaJTGwX6f7VsmmtH/jV38J4YloK7qmQLWNpCaGA8EkgV
         7FpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmWgrbmIdMngtzktmeZyMMUrNVWMMv/JxEw9s6R0ddEEkz7GdWvkf+ouqKv5uocMIiVwTXXGM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzMAiIpfztiuQMgK80A1JdviO4FVKjg78QVPfM+mofPzYdyxEzT
	53c6qWILn8rTrp/9W4TYWNWu4TCg5wKqXPs2zNBm8KOFlUWCXva/NEPVNuZWTeJsjqjzXlo8Uo2
	GkbRTr6JhHv3WAgHgzjc1JCnGewYUxn4yxeRFspf7AKIZcCAE6XOHP96HK1Ama9doHUHuPSUc
X-Gm-Gg: ATEYQzwC7uMaUEcfJTJuwaObmtG/5VIumWlbXAUFKM5yVHlyNtcoeVT5jWQNJYM8CjI
	jaCziTogbzRu37QjUN2K81rxzX7AQuMu200vxKprGKY7YQ4W/2OoCCMweoUUni10eHl+iaxinqH
	+QEKajgOTvUdQY1+OX8RnemTubXmccx/UUOet1SetOYlscliDhBLj4S9bS9EWKrUU8JrWt1eHJl
	Zlp87TpHIFLNrvI0zF4Gs/jCn0caACq07DV4z8aA8L6tNqVfqjsoaCNVx1rwenS5CRWhLtHhK6b
	8hpprjGOQveyb79fqVJklIAHmuP9L40LnaVRD1a8qtyn7ucmzC7MAkbECReq8aV9fwW2+RsuXRQ
	Lwd59dLCxlYRu0sln4Pa0VIEYZmtC0xTpFwQxQmABNOHYFYStUSIgqmQT/1ehvDxlAGV5DWS7z7
	dw2vcJe43pH79WkhW84TU=
X-Received: by 2002:a17:903:2f8f:b0:2aa:dc83:242c with SMTP id d9443c01a7336-2ad5f7b89c5mr131753905ad.26.1771901520588;
        Mon, 23 Feb 2026 18:52:00 -0800 (PST)
X-Received: by 2002:a17:903:2f8f:b0:2aa:dc83:242c with SMTP id d9443c01a7336-2ad5f7b89c5mr131753765ad.26.1771901520083;
        Mon, 23 Feb 2026 18:52:00 -0800 (PST)
Received: from [10.133.33.133] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74f5dd7asm118909235ad.28.2026.02.23.18.51.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 18:51:59 -0800 (PST)
Message-ID: <8280b524-4e5b-45c9-ade4-337c3e86e936@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 10:51:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: Silence remoteproc probe deferral prints
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260212-ath11k-silence-probe-deferr-v1-1-b8a49bb3c332@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260212-ath11k-silence-probe-deferr-v1-1-b8a49bb3c332@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Jq/8bc4C c=1 sm=1 tr=0 ts=699d1251 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=zcgs_DnFwR7u2ldiTvIA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: fyMu295mfJX8qgyyIOixW_Egb4g_xl9e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAyMiBTYWx0ZWRfX4AqRcJ+J+k46
 RSQ/0EF9NDempILETDckN/RG2KsEe7VISs9JiJjOqlimQcZrHWw17fYyJ5QNmolkzOvcdJ0bX48
 V5tYQLRjhHENkLK/az1ivI75d4yIaTrRhsAbDq24vo2LDXPwdQLJDppeRAhMKstw/dxsuFZrGjP
 zv6y95pWFM5nF3coqVEJHEfd9fabIPD3yjcA2X1YKCI/uz+Ga+fNPyEjirffJ9/5zJzGzo8BPA7
 iLBiUsZRAAyggOHW/thq7wKpqpXsPEu1qPa8goHr3QRZyr/bokO47AGNscMRjvs/yo6d3cbVdLv
 oOuctEMl/01WPvAM0TNAR4n5bwR6jlJXuD8oc9nMdudf9hhDNhcHQEgfdm9ftFwn+K7KS9SFI4w
 IPlhEtNIb/JP8d47XKZGWNj4g+JUvy5cce8Tadj7waU5cuBY/KDssR4qbGuWWtVJmcpJGKclk2Q
 dsh249EXzIBxR0F7jPg==
X-Proofpoint-GUID: fyMu295mfJX8qgyyIOixW_Egb4g_xl9e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602240022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_185202_149529_5AF4FDB9 
X-CRM114-Status: GOOD (  17.70  )
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



On 2/12/2026 10:52 PM, Bjorn Andersson wrote:
> Upon failing to resolve the remoteproc phandle one ath11k_dbg() and one
> ath11k_err() is used to tell the user about the (presumably) temporary
> failure.
> 
> Reduce the log spam by removing the duplicate print and switching to
> dev_err_probe(), in line with how ath12k handles this error.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath11k/ahb.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
> index 8dfe9b40c12626649639fc1dd9da0e5e0c2dcaf1..08d3a0c8f105b26b1548c5d6006f6ea162fe58ff 100644
> --- a/drivers/net/wireless/ath/ath11k/ahb.c
> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
> @@ -807,10 +807,8 @@ static int ath11k_core_get_rproc(struct ath11k_base *ab)
>  	}
>  
>  	prproc = rproc_get_by_phandle(rproc_phandle);
> -	if (!prproc) {
> -		ath11k_dbg(ab, ATH11K_DBG_AHB, "failed to get rproc, deferring\n");
> -		return -EPROBE_DEFER;
> -	}
> +	if (!prproc)
> +		return dev_err_probe(&ab->pdev->dev, -EPROBE_DEFER, "failed to get rproc\n");
>  	ab_ahb->tgt_rproc = prproc;
>  
>  	return 0;
> @@ -1190,10 +1188,8 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
>  	ath11k_ahb_init_qmi_ce_config(ab);
>  
>  	ret = ath11k_core_get_rproc(ab);
> -	if (ret) {
> -		ath11k_err(ab, "failed to get rproc: %d\n", ret);
> +	if (ret)
>  		goto err_ce_free;
> -	}
>  
>  	ret = ath11k_core_init(ab);
>  	if (ret) {
> 
> ---
> base-commit: fd9678829d6dd0c10fde080b536abf4b1121c346
> change-id: 20260212-ath11k-silence-probe-deferr-28c2532bcc1d
> 
> Best regards,

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


