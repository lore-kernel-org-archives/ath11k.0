Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92285D35673
	for <ath11k@archiver.kernel.org>; Wed, 28 Jan 2026 04:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=01WPymxPr6dFESr5iulugWLpSo/Ze9nDOyQFXTGnaR4=; b=ZMpHBK9uKuyCb7hbSeg5wfq8tL
	rw5ggzKYsXzyOt5Gy2QZPknNr6PJRHCddF/pkw8yJbv4JfelmQIQSv5pySs1GPG7arAQ4DgNCIOPi
	kx6zIU4tLAURXJgj4Tm+JWHQjBwDsVOqKbRg8/jwGUKBZ3uI6DiQ0Pd/DAC84PNDoLSg841Jb1kab
	uy/NF53kA0TEIoJKKCtch66NxMg6M6U+SxqJ3Vu49XMInxwPOJ5PhSqpNAeKQR5mXcm83E86E9iTN
	PMBzEnoJuhwarySMUNHz82qaDYDFY2iVhTkxtVLTaSV2X7ucIzZbP5cGsq7xzC/RW/WQIIs1u0p4V
	6l6dWw2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkxOI-0000000FR3Q-21HD;
	Wed, 28 Jan 2026 04:42:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkxOF-0000000FR2a-44Me
	for ath11k@lists.infradead.org;
	Wed, 28 Jan 2026 04:42:53 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S2x19R1980951
	for <ath11k@lists.infradead.org>; Wed, 28 Jan 2026 04:42:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	01WPymxPr6dFESr5iulugWLpSo/Ze9nDOyQFXTGnaR4=; b=YhJLf1MDT31LW7K7
	hV+GrsI6jiQENFBrJKTaHhcCfYrcd2zphxrwVf+ClMp3GkE0roL7pT3jdElH/Pot
	TcmoGE5IzML3BP7C6kE9QDKbixBJN758000AgS37+dV/2cjs+nJK5U/WS6OTdgbH
	KfWlKN3Ih0TGTXLq6rLhXvZAj5HwpUlSNT+6uYIN9ULqBWW8V9+nFw47Pa2sZe77
	zK2rLOB76Np93rEajMXM8UXaW22cUepexIcUpQ2NKL3HO7y+Slnzndg0jMtg9W0D
	GNKYOIY8fyzfnRPXSpB9wLQyFD6W9hah7LyiuZoArdfzgwKEXn/PnCeOmT77U6Gx
	KP31Zg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by1jx1yq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 28 Jan 2026 04:42:51 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-81f2481ab87so5297575b3a.0
        for <ath11k@lists.infradead.org>; Tue, 27 Jan 2026 20:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769575370; x=1770180170; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=01WPymxPr6dFESr5iulugWLpSo/Ze9nDOyQFXTGnaR4=;
        b=J83winJDyxxpzVpfPp1nkOeIk+U4gXP+UazCf22rFwuLt5kBYcp703Y54FODlih968
         hAvSU3V7+oKJUrZw1T1qLgHGOWghBJjpfxc4vt2tS00GoIXI3qAoMb12hqYfbA2y+udq
         lht8ZotD/xW/hdFRqLYKcoGpirArigEarCS6NRRVbdD6GPDB/bjB86d8Y0sQn6oEhPF9
         N21mwcoLO5fKGbfK2jlWJDVbbnI7se8ffWpIk2Wixr8SLhVgyADGg8jctBPP82LI0quW
         F0CZ7r03okDhFatKbcir7fa5hXAJxMuz6SN+M1HiujJdpd3MNufq0ufFP14ILW+Im0O6
         N+yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769575370; x=1770180170;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=01WPymxPr6dFESr5iulugWLpSo/Ze9nDOyQFXTGnaR4=;
        b=Q7VhtKqWVm3EO93gARfVdMqrhhneoE3x5kyFP6yqFNNw0CSuvTmq8NB1queYCWQe06
         wYAT9HpkMLvVogUwjRwN6FbhTuvxGOtMhUUsYMBSLBGlRBNFGRk3YZne9+5iGeLbYuN9
         5FJL/qnafaINzeX9AYYKG4F297xWKuBOz0XSdWUYpslFfXdLCO0RxkZgvHr8emPdWHrd
         eOeHfNdypjtu25RA79oaB50or6urkcS23Ylq0b4KVatr8TGhAwDzeBfqpR5HdpF5AVGP
         /n1mIodxNQHIK54woufZ4fkL8luksu4UB4nh/TJO+9koCOiNlcb7yr2kLsU191hZBa+d
         RthA==
X-Forwarded-Encrypted: i=1; AJvYcCXWLTtWqmJVAS+vXRGZeNT04E6HeV+e1xtIcG3nGzyUBhv/0mFLfRBDLvWSYCFN+p9+gn9VVWg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/JvYuRlgfD9oC7iAz+S3IJ26IObiw8F24AED7AhlNsLyl10wD
	ilSVIdh7RV/hAfd1uDiHbBlv/4BRTEd16GQPmgRIves47lTc4wNVzu3ZE+mJPXc4NgyDy6OIuh1
	ocbTADBYnBo89yTCBh+n4mK6jOzPMncoPX7iZiyJfcGftL5awiVhL9Bfe64is5vA0
X-Gm-Gg: AZuq6aL8sfd609Em6IirfbnGPeD0yNDhhREPJiKiFJggFR838IHVYD22Vj5DeStRLJi
	+qG8MMD8slExeLLM75Ae3nHowyjUA+kBhwMfcs4S/vHT/7sviNHBQgexTCPJ2kNm7PS4+75RaQl
	tBOsX4/UYeR/lr/95t5gn7ZYwZlT1Ex4KjjyBVcKLCl1g4EzIZDwHA6EN3WwJXIxtuaPABysh6I
	5XghDVsvA2CH77ibidESn/d1Wkz+eJV3OQs+yCBpDAdnkx/by0eVdQps4fqVUz6NlutP0GIjByT
	zuTbJdSgY5qSVDoQW75G2tJ+GhGEHmA223VVNax+MgRVefI96EAGvHSLQeV7e1+C2h8Zs8Rup5o
	zHiUuM0GJPqiNw7ZdoTjwtVXhUzo+ZFkCZYLTf5Q52AjY34VGvoXT7js=
X-Received: by 2002:a05:6a00:ad02:b0:81f:2b25:ca73 with SMTP id d2e1a72fcca58-8236927f93emr4084127b3a.38.1769575370104;
        Tue, 27 Jan 2026 20:42:50 -0800 (PST)
X-Received: by 2002:a05:6a00:ad02:b0:81f:2b25:ca73 with SMTP id d2e1a72fcca58-8236927f93emr4084113b3a.38.1769575369630;
        Tue, 27 Jan 2026 20:42:49 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379bfd729sm1059822b3a.44.2026.01.27.20.42.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 20:42:49 -0800 (PST)
Message-ID: <a1df48e2-bd02-4d13-817a-4f27e449f93f@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 10:12:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current v2] wifi: ath11k: fix wrong TID passed when
 stopping AMPDU session
To: Pablo Martin-Gomez <pmartin-gomez@freebox.fr>, ath11k@lists.infradead.org,
        jeff.johnson@oss.qualcomm.com
Cc: linux-wireless@vger.kernel.org
References: <20260126174049.1370659-1-pmartin-gomez@freebox.fr>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20260126174049.1370659-1-pmartin-gomez@freebox.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: neOB8Q3L0PWbCYFZacEatlj0GQb0dkNC
X-Authority-Analysis: v=2.4 cv=duPWylg4 c=1 sm=1 tr=0 ts=697993cb cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=4MSwVuzKff4lAtYpjw4A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDAzNCBTYWx0ZWRfX7NZIn2At2Q/I
 b5DroehVQSbE+LwOewKbULK8e7ItO47e4X8rMeQ7xl56t6p+9V10WGbpuRWTLC3pH89rvUgOves
 v0NdH7P+M7xU78l0/w710m+uplsggkPQ0JvQo3RuX1oEVDIZxbzdkPIplRophUNoqr/ZKZqqQ/1
 d/QFI7CMD0Wb7Yu16n7yoO03wtmAc8ef+QaAP6jaJaeP5GFMItP4m/DmTFbn8CTFADYoQGxbRzl
 DCA+ZEBQq3poi0+vpTJieeMJFrg8OnFimWRqSNhysMRn4gZEsnRRibcKdIDo/p3heJOsAvOSldf
 +X8cadG9Mhm2o92YBYE+cyW6FLD7jXYD+HcZuO8H82krwMye2Bd2lVAnWuDTKkVW3L51lT7poVG
 E41ch/0WdQrwVxBryjmlP7Relw/kf/KcAUapJGQe9T4Gr8W/oy/xt0KdSMko2RqVXEptB5krycr
 qvFZHZREQPOdQh1GyvA==
X-Proofpoint-GUID: neOB8Q3L0PWbCYFZacEatlj0GQb0dkNC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_05,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_204252_019467_D3D64153 
X-CRM114-Status: GOOD (  13.74  )
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



On 1/26/2026 11:10 PM, Pablo Martin-Gomez wrote:
> When handling a DELBA request, ath11k_dp_rx_ampdu_stop() calls
> ath11k_peer_rx_tid_reo_update() to tear down the BA session for the
> specified TID. However, it currently passes peer->rx_tid instead of the
> entry corresponding to params->tid.
> 
> Since peer->rx_tid is an array, this decays to a pointer to the first
> element, effectively operating on TID 0 regardless of the TID in the
> DELBA request. As a result, the BA session for TID 0 is stopped while
> the intended TID remains active.
> 
> This leads to incorrect BA session state and may significantly reduce
> RX throughput, as traffic that should use aggregation falls back to a
> BA window size of 1 on TID 0.
> 
> Fix this by passing the correct TID entry:
>    &peer->rx_tid[params->tid]
> 
> Fixes: fe201947f8bd ("ath11k: update bawindow size in delba process")
> Signed-off-by: Pablo Martin-Gomez <pmartin-gomez@freebox.fr>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

