Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995BECCF9F0
	for <ath11k@archiver.kernel.org>; Fri, 31 Oct 2025 02:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zaaBloIJGhaoPgQ7d71zW2258dFe1LLg6EVGK/EBrpk=; b=She4nhwHp2VqTRlK/5T+xFrf+t
	g1JdAhpClwDUyCvgDAjFyzPqKpIe9fuxJQ3qJR/ydkWTQoUJOXaPHTByE4BCFMtDXJXGtrLnmlcJU
	Lx9VbP7iHWljYAuYceVjZwNALrxkjYDiE5PTa47HlanW4ltKemwGGqyrvSdpsVY7e6YG7hl6pkDDO
	aCtcG+JiFDmHYThtSOP+YLRyx+5XBBeQEE/Oghw5NDRJfN5xwTEXS0eoC9ByYePROuWQVG5YN1oOB
	rD9qj2UN8TTtOJNSHuzlE2OAsKu137cLMnS9a+4DU7OXsztWdifDQsR3L+ZonK6AsBbJALGiDZlWV
	uf2soPGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEf6c-00000005HN0-2rI3;
	Fri, 31 Oct 2025 02:43:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEf6a-00000005HMa-0JfL
	for ath11k@lists.infradead.org;
	Fri, 31 Oct 2025 02:43:09 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59UIdfXP3117567
	for <ath11k@lists.infradead.org>; Fri, 31 Oct 2025 02:43:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zaaBloIJGhaoPgQ7d71zW2258dFe1LLg6EVGK/EBrpk=; b=DMbdBDJyehDD5EkG
	3NYYD9iuLX2ZZjLN7z//9yHqBW5zaf1leAY2I3+vf7LGxHr8E0igItnzHFZV1vgs
	TcBLpQuj66vCxy9Ldaqw55ktwx/8GdarNR4jBIamzDGw8dIxPYE/A3WPl0FhYy3h
	Lab3GZUPWmvmY7R0ClpqE5XqjGeHN5//qWNfmXmypiT8IncfIJE8RlG4ys3YpEfy
	HU6KgL+vsyOcMfmEUb7y54HiaDDu0UUkLvPy0VeeOncMEtMBtra7FT8VwMFGHSRF
	E/PjF4lf8YhCnkvN0BqwaeO/zfPpdRMqvN4s+Gj3xl7w4UQnMYoS31Ryd+02Q4TS
	l4TzRQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a45frjm0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 31 Oct 2025 02:43:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-290ab8f5af6so16789785ad.3
        for <ath11k@lists.infradead.org>; Thu, 30 Oct 2025 19:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761878585; x=1762483385; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zaaBloIJGhaoPgQ7d71zW2258dFe1LLg6EVGK/EBrpk=;
        b=Dehn9U+QznMqlqyZX3vHCSZj3sMNxLfZbRDKp/10c3K+oYAqxt0EAWOwQaC2z/LG94
         VKNqisHLGyhvBbylkLpHZwIhQyGuzSzAnF9fx+6lvvJM0mxVmZFQVSwpY9TMUqBhihDW
         WaAc7Ao7xfmjKoR600O9xvdZkiEqGRUHj9R2L3FTz6etQ45rWKXBFZ1rnIiyNlAjaLyt
         nadYJyJyArEi+pfbuv5L3zY+H0IA7HV/yPdNdf6eelIo6yx2Y1o7fbjal7+tC40XmZPi
         48IDLHX2BegGUVkh9mvlIwOGsV18zWgQDwOan5xVUczv5WoUrkxQJ/6WgtxP+ArqnE25
         XYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761878585; x=1762483385;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zaaBloIJGhaoPgQ7d71zW2258dFe1LLg6EVGK/EBrpk=;
        b=Ri9NTZKaQWpbX7YxRH5WmtpwJZvY0z6eN0EHPpmWqCHWHKO+zY64gugf8EwHCWmb/K
         5pPg/BKYLK7V2ccZuzOnok467iBSVwb8nooeMWApHMnnRc4KzB7HTWhe+EhWiJT5HSw0
         +Yi22K4yPIwqDBQlnmqQU2vO73CDpZVjuoS04lW2uhk3lNIg2mQ2HE+LfDYg4gBxEJ1J
         Rh9Hg3+sfyJMo1EcMSg4h/hLJmm0F97HywhIcUsLat5CItjdouqm3J75b9QXONStcVOB
         z2ZG4eF5li5ErB9dDLXnZ6XdvxRrOjxezsfioNPz+axjecMnBAT3GLhk/KGT8PIRSp4+
         mitA==
X-Forwarded-Encrypted: i=1; AJvYcCUYAGlBTiw1roSDPu2LcJGs+dizV7C6l985V+5ddDqfhqrVEW+JBQeaFFUw695nAemtwPOOQ+A=@lists.infradead.org
X-Gm-Message-State: AOJu0YxvsHRdzXipd4YW9/0Eqw1YbpFmsDva5eSUqtdcl0Gua7gGDLtg
	pkWHmo+fZmzDkPGOUk0Y+3CHbFb/dE2d2jmn8u/AMHUM4BsQa8goti86OoBHh7oE8NGdua/9B19
	ECYNfZasNiPB4Il1QaxeN3Lh+CghEFAZPVKxGqlY0v8LuZ01I42ReD79brluVbUEb
X-Gm-Gg: ASbGncuUiPa6LgckIDvmSnQ0ROdAk9jX+b6dJiwihcGQFK+J7Xwm+s0AWZLOsvndKGK
	7Jy6syF5nKiBszcM9kNGwUuGrn3eqeGiiPMe4Lz6ouSf5WtyVaTa9W9Fq9vgB3+R+N9kOciXsQP
	Efvm9XGDphCt2gExuzJ9m+F2T+w/mVXDCUyJrnyt6JGyOKVRSIecx9VP2ls1Z6Wfb4WkW7aym2t
	RpR/E+fL5xu5zeNVndcD106qOX/XI2vU75u/KEY+0L+X1J+CGf5QFDeh1AXzvb3CJPnigVgtefk
	3i5CW+vp61d0aLov5damsKIxEdzEWr73yBsnYGqhWOZXtrAdbqfISqCLjkYJfZPPHhdUsECRWx8
	l4u4aUKbVIFyw71ovT65fv2BGkixvQf11STiudGVSvRzirskbgXh+IDpCWljDHcnP2LV5D3A=
X-Received: by 2002:a17:903:41c4:b0:293:b97:c323 with SMTP id d9443c01a7336-2951a4d8a1amr22756855ad.32.1761878584939;
        Thu, 30 Oct 2025 19:43:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYAINtH87QCRpaxqVNeNSoSEV2daxmlFd7YpOAhUp+qFnEbICbCWiL3U2ZX63kl/mhI4m9tA==
X-Received: by 2002:a17:903:41c4:b0:293:b97:c323 with SMTP id d9443c01a7336-2951a4d8a1amr22756625ad.32.1761878584373;
        Thu, 30 Oct 2025 19:43:04 -0700 (PDT)
Received: from [10.133.33.51] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295268cdfcesm4592145ad.48.2025.10.30.19.43.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 19:43:04 -0700 (PDT)
Message-ID: <ba928aa0-d1d0-4e10-bfd4-ab7a577dc8c1@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 10:42:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 1/6] wifi: ath11k: Add initialization and
 deinitialization sequence for CFR module
To: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>, jjohnson@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org
References: <20251030043150.3905086-1-yu.zhang@oss.qualcomm.com>
 <20251030043150.3905086-2-yu.zhang@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251030043150.3905086-2-yu.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KupAGGWN c=1 sm=1 tr=0 ts=6904223a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=d9LWlda1mWfGAY6gbx0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 5p0ul_2BZ3Ie-DvihM2kcU-Dogh9-8En
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDAyMiBTYWx0ZWRfXzTxTBKvX8f4s
 QZOvjAxFLWIPQ0Gm+odJ2m+YTt8SDhXgb5LuzpZvc0fwc6JOIXkfL47klj9HC7kfDY3a9FiS9ag
 6kvwAau55gGO85pdNsLqduICfnCydNDdVf6Gd9nxqos6YRF/f8K2MIFa1GxsWDX1AeqzP/xDIkG
 xY5GUgj+/mro/wclEvc4ascbcmWEs8OocBN2Lj+/irM+6PsD7kEywsg6avZz61MZ6/uUlpHerV6
 w0GRKsFFiMmW2jSPWI/6mAbLDQ+SE+dtfOdR4+lJ9zPeWxBNgs3gXs4pJ6GHHFnhC2BTWtTUMLd
 OFDZUSz3vKl29vBot0s0MqdxzgWYXzzLXrnLZMSFGJ03gY6S1n7XIoDfpkv1/nGmsYLv3wr3D8e
 6WN52fBWj+F6p1SJSI9TRhhvbNSdqg==
X-Proofpoint-GUID: 5p0ul_2BZ3Ie-DvihM2kcU-Dogh9-8En
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510310022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_194308_313536_C6FD8E78 
X-CRM114-Status: GOOD (  13.77  )
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



On 10/30/2025 12:31 PM, Yu Zhang(Yuriy) wrote:

> +void ath11k_cfr_deinit(struct ath11k_base *ab)
> +{
> +	struct ath11k_pdev *pdev;
> +	struct ath11k_cfr *cfr;
> +	struct ath11k *ar;
> +	int i;
> +
> +	if (!test_bit(WMI_TLV_SERVICE_CFR_CAPTURE_SUPPORT, ab->wmi_ab.svc_map) ||
> +	    !ab->hw_params.cfr_support)
> +		return;
> +
> +	for (i = 0; i <  ab->num_radios; i++) {
> +		pdev = rcu_dereference(ab->pdevs_active[i]);

_deinit() runs during driver unload etc where pdev may not be active hence issues can be
expected?

besides, pdevs_active used here but pdev used in _init() ...

IMO, we don't need pdev to be active here

> +		if (pdev && pdev->ar) {
> +			ar = ab->pdevs[i].ar;
> +			cfr = &ar->cfr;
> +
> +			ath11k_cfr_ring_free(ar);
> +
> +			spin_lock_bh(&cfr->lut_lock);
> +			kfree(cfr->lut);
> +			cfr->lut = NULL;
> +			spin_unlock_bh(&cfr->lut_lock);
> +		}
> +	}
> +}
> +
> +int ath11k_cfr_init(struct ath11k_base *ab)
> +{
> +	struct ath11k_dbring_cap db_cap;
> +	struct ath11k_cfr *cfr;
> +	u32 num_lut_entries;
> +	struct ath11k *ar;
> +	int i, ret;
> +
> +	if (!test_bit(WMI_TLV_SERVICE_CFR_CAPTURE_SUPPORT, ab->wmi_ab.svc_map) ||
> +	    !ab->hw_params.cfr_support)
> +		return 0;
> +
> +	for (i = 0; i < ab->num_radios; i++) {
> +		ar = ab->pdevs[i].ar;
> +		cfr = &ar->cfr;
> +
> +		ret = ath11k_dbring_get_cap(ar->ab, ar->pdev_idx,
> +					    WMI_DIRECT_BUF_CFR, &db_cap);
> +		if (ret)
> +			continue;
> +
> +		idr_init(&cfr->rx_ring.bufs_idr);
> +		spin_lock_init(&cfr->rx_ring.idr_lock);
> +		spin_lock_init(&cfr->lock);
> +		spin_lock_init(&cfr->lut_lock);
> +
> +		num_lut_entries = min_t(u32, CFR_MAX_LUT_ENTRIES, db_cap.min_elem);
> +		cfr->lut = kcalloc(num_lut_entries, sizeof(*cfr->lut),
> +				   GFP_KERNEL);
> +		if (!cfr->lut) {
> +			ret = -ENOMEM;
> +			goto err;
> +		}
> +
> +		ret = ath11k_cfr_ring_alloc(ar, &db_cap);
> +		if (ret) {
> +			ath11k_warn(ab, "failed to init cfr ring for pdev %d: %d\n",
> +				    i, ret);
> +			goto err;

you need to free lut before jumping to error handling

> +		}
> +
> +		cfr->lut_num = num_lut_entries;
> +	}
> +
> +	return 0;
> +
> +err:
> +	for (i = i - 1; i >= 0; i--) {
> +		ar = ab->pdevs[i].ar;
> +		cfr = &ar->cfr;
> +
> +		ath11k_cfr_ring_free(ar);
> +
> +		spin_lock_bh(&cfr->lut_lock);
> +		kfree(cfr->lut);
> +		cfr->lut = NULL;
> +		spin_unlock_bh(&cfr->lut_lock);
> +	}
> +	return ret;
> +}

