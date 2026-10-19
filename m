Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587E960A2621
	for <ath11k@archiver.kernel.org>; Mon, 19 Oct 2026 16:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UbBaEkdA;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nfWXGEn2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JFhuqTOr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DrHjVs3K5knpICGJJRURjLir0JgH6n3UDboXHBkcEBg=; b=UbBaEkdAeUCA0+h5t2LyRpsw5W
	fUUgVK31fQcDeQrT/rfm0tjnn2YAtKQpKjUbwRoROarVCM2dSWd/L66mqDz4x9+WzwFP6cjug18wb
	gU1pZd0Sq27QpVuUZBP2gdIrgaZTJA/25LmmrH4cAM/SuoDw9N80KBoHXsGG/dIZbddu55GY9GBcF
	PVEQZG+fVNMBG81lZWrH0z9VNFpcWQ2Vwb/Z5rDBfREKlSS6V/UGRuiTsk4kqA1bJlW5s8Dn8mTSA
	eFHOwXafTFr+rmvQqz7S34CRIVlQkde4Fs15gJbsSa0fVX13xiK79tg3xdml8Vhhzq/EgHLGvci/F
	w5wGPiYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIqVn-000000081OC-3fV1;
	Mon, 19 Oct 2026 16:46:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIqVk-000000081Mm-3FWd
	for ath11k@lists.infradead.org;
	Mon, 19 Oct 2026 16:46:58 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JFPMPK1645924
	for <ath11k@lists.infradead.org>; Mon, 19 Oct 2026 16:46:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DrHjVs3K5knpICGJJRURjLir0JgH6n3UDboXHBkcEBg=; b=nfWXGEn2NkcNVPpA
	Sapb6Al6dKB6XBK/E7Wc91YrpmFkKXGO6OidMfRTzWW0xmPq3nrdhsKdgyrlEsjt
	8XcTKHuYqy5FHI3vermFeKBj0SCDdpxGyQbasIr7oeeuabDeBVVV7RD/6czWALvA
	kea82WILN2a96XvK3mCrgJye36wgVWic902BlxvJcPZOarHUuvx/CuWWPgEJLo7O
	btWw1tscYss9RtGlfejcDaNkkW7/wKHMh39LBXHtXHK+JVB5mTNBS79sAtAdGuy9
	Lk3Vxq6IqiLAjOPZ/TAyuQ0uS320TXv7b089hyCVGfmYfbkdChj6UqF6gC28olhq
	D4fEEw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf65j8jr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 19 Oct 2026 16:46:55 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c902e0da2so4349482eec.1
        for <ath11k@lists.infradead.org>; Mon, 19 Oct 2026 09:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792428415; x=1793033215; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DrHjVs3K5knpICGJJRURjLir0JgH6n3UDboXHBkcEBg=;
        b=JFhuqTOrWySuBzf2hFdQXAUreGrxQUt3mJYImm2scqQkR81uJZqD0Bk39PKTMxitMQ
         G5M8nAuz+kXqoAcvY5UA7r/YoiWQueokzuQMATiVr3d6qrjnvoKepkO8BLQtjXoW21P4
         WK36t/JEHTmFwJG99M7+YRHqG6ort5O/gr8hNfqsgOAKSGZ47bA0S1QvpeyZxJQ2O10j
         kVKWVNCKMAXCUOGgGCVztxkRtGeQpvJuWNrN2yENPrLgyG8Uzawi856JWXQnsKJJQvNW
         tiZS4AWd6eDPyGLcFfAMV0N+Tl3YQvOl5y9cDpSJU0vJIMFuDdwZsq1oA+opK9fkCmD2
         3/2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792428415; x=1793033215;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DrHjVs3K5knpICGJJRURjLir0JgH6n3UDboXHBkcEBg=;
        b=ojXLC8skyc8WeutQGBF5K62W6JRvPqtGSd7Er1YpeElQkP3p2EX+irtdI24TaLbEF6
         JWo29vuTyIb6Ylej+Pyg342mG6ZIoUmTdiTjMXlPzUhSIbWc7bYL05l5Gs3iYQ49pw51
         UhXeX2ChlmLr78cE2I1C758/CTCpAozvDIHHunGBHhKdW51a2+PbWUYZxjSW/ltPhQsU
         lzhoDMQ8vxT6BeP/4MlC1KcVrbjC3oKqDi3lD3bp4EYsBUCwhZcMSDpa06YTPxc+mYJq
         8QPfYzvFyf567JmOF5A4wENTMPpeuuSlDDQLi4p66BSbC9azvM5uMDlIrHBV2fz3mQZh
         T2bw==
X-Forwarded-Encrypted: i=1; AKwUvBz3nOEoxhHRGdHLo3d3WA49aafpO0BMaAAIsklPca8SCwMh7/21hUHkhPCFXrvmD1C9eW5jRVU=@lists.infradead.org
X-Gm-Message-State: AFq9FYLQaAJvJxdUeaeFuOuL5rLwuVWD9uWxKPAvozo1996UYv7D+RDm
	kc3f9+K3ZXjq32d6aKzHrFFw56LPzeAHEVrjhzmoj2yk8e26Iv605No4l8NOs+1wwpYdnE8T9cx
	CZhdFBnEvudQocNkdEJyfDQShXB46LIOJapjDrWL8oRDMPs1jQLWL154DfGSV20/P
X-Gm-Gg: AYBFou1B7ebDpf0zYgl1sdE3EOWAYnxkcTNBdfRpnvfrD1VvNoq3wUc1NZ/TlN3bnpl
	0bqekEPUzke/lWiDnz48Ez3vkxNmhYaq6dpBV/HdYHw184hbb8pNF1mo+a6ZanFe/c8YV3EtDVH
	z/j9/6tvWRRXGRR+7iRn7fOoLkRFOFj8qJQ2wJ9qm350sn7BFXqfmWeOE1ulkOGX+kNeWdX4RvH
	PAVpNJQKjK3fXWuQBn1o7es23342TIYFhaKiJrQB+3BsktGoj0JBWBeMDfVv2KOcvpHJehKa78Y
	ojchzCsmvp46SatXXKCHZGSGZWEbJ6nqvYU6IR7Rxz4oLE9sL3N7RMHMDKoGDiD6Lk5CT3qgRpv
	Hz9ccQ1ZaYDYssHFHMgmjkuP7bsDmIggetoQxnorxAmsbWyaqEx6ALrVcgw==
X-Received: by 2002:a05:701b:220e:b0:159:d448:dd1c with SMTP id a92af1059eb24-1825a67565cmr13293187c88.19.1792428414335;
        Mon, 19 Oct 2026 09:46:54 -0700 (PDT)
X-Received: by 2002:a05:701b:220e:b0:159:d448:dd1c with SMTP id a92af1059eb24-1825a67565cmr13293157c88.19.1792428413560;
        Mon, 19 Oct 2026 09:46:53 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75ac0fsm29699093c88.15.2026.10.19.09.46.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 09:46:52 -0700 (PDT)
Message-ID: <e98854af-f5a8-4c8b-98ad-9af673384f57@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 09:46:51 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] wifi: ath11k/ath12k: validate firmware array lengths
To: Jiale Yao <yaojiale02@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        Shashidhar Lakkavalli <slakkavalli@datto.com>,
        kbuild test robot <lkp@intel.com>, Julia Lawall <julia.lawall@lip6.fr>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org
References: <20261019100506.1915181-1-yaojiale02@163.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261019100506.1915181-1-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA2NiBTYWx0ZWRfX50a41753cmDt
 2pn/EFDMHTpxZMtwa+o+FnzYHX46m9wW/SAsEymSlAX/4gCWRUsU8oKDz1WS0GhGL1Tg28WAZ5u
 ncySjGXuiTYAQ81Qc/yWMej5vT9eH8A=
X-Proofpoint-ORIG-GUID: E7edrsO-QxU3rFYjTJOl20HWdZdiXoyd
X-Authority-Analysis: v=2.4 cv=Y5ptIReN c=1 sm=1 tr=0 ts=6ad6497f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=SGwW7hRdeZfZbUOxcl4A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA2NiBTYWx0ZWRfX1UpN253iEh2e
 8MjDdxOrqQkniu0y+JKB+dQppPaGNxmrEjN+GpfCr6y30pj/gPjBlw3KtT/e5yqJHmqYnkRQYKh
 nPCiy7eSo3rQTvFPbeLXu8SPMQ2XmtGba2OCCanHoCfJOu+O1r8//pjVlD0OZSZwkinntO4fHjT
 FTWO6UTWu/M6rLKVul6wTeSeiVZJx8NX6pW7W9oAKEmSC+Oq0RCF/jXfcXGfKWQAc1VQweRfsGs
 mU33RAACxVGUSdjQdtPf+jFOh2oCo9SGn3eYSb3xqPiuxZE707QrHbsXq/PD53Mu7zZyAatnHma
 DqQTrXQm1NqbrHkuKRX+ZTzlJ0ZNDaHfpcNG0HCXRSqvZmXv+4HvFtA5DcNuwgyIXjChwAAekRE
 lgUdlcidtttUnHLGY7JN15cOW/jJjgjq+CkLoB5CSoGOXKMv3Yrx2cDQbnlCHKZOFDf1E5UVFXt
 4CedLRyiniwZ0HgZ8Eg==
X-Proofpoint-GUID: E7edrsO-QxU3rFYjTJOl20HWdZdiXoyd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_094656_824650_1CC199B3 
X-CRM114-Status: GOOD (  14.67  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/19/2026 3:05 AM, Jiale Yao wrote:
> ath11k and ath12k consume two firmware-provided arrays without fully
> validating their lengths. The service-ready-ext parser accepts fewer
> extended regulatory capability entries than the separately reported PHY
> count, while the ready-event parser trusts the reported extra MAC address
> count without checking the fixed-structure array length.
> 
> Malformed firmware data can therefore make both drivers read beyond the
> corresponding TLV arrays. Add matching validation to each driver before
> the arrays are indexed.
> 
> The four patches are independent and each addresses one parsing path in
> one driver.
> 
> Jiale Yao (4):
>   wifi: ath11k: validate extended regulatory capability count
>   wifi: ath12k: validate extended regulatory capability count
>   wifi: ath11k: validate ready event MAC address array length
>   wifi: ath12k: validate ready event MAC address array length
> 
>  drivers/net/wireless/ath/ath11k/wmi.c | 10 ++++++++++
>  drivers/net/wireless/ath/ath12k/wmi.c | 10 ++++++++++
>  2 files changed, 20 insertions(+)
> 

(dropping obsolete codeaurora and quicinc addresses)

You seem to have sent two separate series. Which is the correct one to review?

And more importantly, where are the Tested-on: tags which indicate you
actually tested these changes on real hardware? There have been numerous LLM
inspired code changes lately, and some of them have caused regressions, so you
must test your changes on real hardware to be considered.

https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath11k/submittingpatches.html#tested-on-tag
https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath12k/submittingpatches.html#tested-on-tag

/jeff

