Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E54ABCA6017
	for <ath11k@archiver.kernel.org>; Thu,  8 Oct 2026 21:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bTmDvHbME4TFPnudbIvelUAwa8csw0mAjHsQ39CULK4=; b=kOteaUBUblXGJgVqbY3uSFeVeF
	FcVz0O8VXe/j4N7E9THXCX9lrChJAbQjqz4ht5e2UQohIbFf4oCc37POofTE5XjXiMMjF6OJ/hRf+
	+7LnER9PN8KbH+VPfOHAt2hlifgxv7RfRkkQDCsUlRVIRvEpbA4xaESq2LFwaas5LVr/AOBJimHR1
	/qE9lnL9iR2w7sqvJ6YJS5h1WjScDHT7UTuhzpM/uqv7Eit1zcisy/qSLJmbWhngqZBscFGhgh3tc
	f0uuzRAQiyUPRt8Ia/LdwhaF9WkCaCQFJMu1O3mhwuZuYsAXuJKf6OywcwsrPhr3BYth6rr8V62sc
	4GHvo8SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEw8E-000000056Qd-1EYg;
	Thu, 08 Oct 2026 21:58:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEw8A-000000056P4-3G33
	for ath11k@lists.infradead.org;
	Thu, 08 Oct 2026 21:58:28 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698L06fW3648759
	for <ath11k@lists.infradead.org>; Thu, 8 Oct 2026 21:58:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bTmDvHbME4TFPnudbIvelUAw
	a8csw0mAjHsQ39CULK4=; b=DPwZ89b1oSlNDZlbCEK4iPDSS/zrKliHuZtJtxjB
	z3kmBixlpcCWTTPBLHVyrPrRaHGGhwxTC4HGHiRjSZaRMeK83bNf4/d3vYaLh2QW
	9mRjdIsQNCQsZSgnOUjYtPMH6OweE70WVOi+wSEpBm8kIdV/CRzoMoiaQ102kkPA
	/kK7T9y/Qn7hnLVxNwVjMA8pJOL49ZXQrHLvGMjndb5kxmA/T6K3NA6SAAascDKS
	PRNCrw0LbXnTfAMd8y59yCCeRJpthPE6RnaCGUK2n0tSedUl/pzsVF/7U25OQX9u
	+2d5WLkf+KES/MQYMD7Rzksail5ygHERtleIB9xFMsDHIQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fmqrv78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 08 Oct 2026 21:58:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc5f70c8dso661793285a.3
        for <ath11k@lists.infradead.org>; Thu, 08 Oct 2026 14:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791496704; x=1792101504; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bTmDvHbME4TFPnudbIvelUAwa8csw0mAjHsQ39CULK4=;
        b=dudNndoTAsU8qEtEGWAQdfYT1rLO8XUZlRz3lBInRGB6D/E+c72yiwVqkVwfUxmgVZ
         Jv9VqE5vXob2egxyc6E7EYg/g6D1kzmnK7QSQueMHOmVCPIYyOmKo5BqHfxrk10eZXq1
         16YomDxirQAKnDoRMOvBoQVXnVOT1KtL2RQQwFB8h8gkVgrnvjHFMPEZ7xdqETXZ+afL
         YKJgRPOa6X2JnuKNqZGnaukqJeC+lQqaQDzhN4hp1XtdoX2UHvbnEET0Dtlh9TywVc07
         kH2AknBvEIimr77AONStUK9tujnMLt4U2cP/Xk22ml1vQls/hLslcsIrrzrLoJBH5Rvp
         Iwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791496704; x=1792101504;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bTmDvHbME4TFPnudbIvelUAwa8csw0mAjHsQ39CULK4=;
        b=FHp2g5OKBzTjXHudjKTFnEUkGV63XCi/ScrQpr1DjqUFRMFdyw//bOiucbDFKC1bHn
         gn4aTg2eZPS0uKByQzrrJPDfzn8e8vTNLpMDVsRuyRgTltPZOPQ9/VlyKBf12NzMjo2k
         S/zBHl78JuxZyUfQL35f9h78wJ85ZYB9MWmHnEAtroCoFCTRPY+YxQWzv9UtVacmwLsJ
         mEKjPOruBI4fbxqa99oiS8Ok4evjPjyVCgpGRlRFizCxFZPW8VqGrcNwL4bGpjOVqZF0
         yJyekDow70VhBbIr29MFOY6qGfg7/uDtYxAgVAFifl5FMEYs/XMJfqWQsFw8qPp/0/ND
         8qNw==
X-Forwarded-Encrypted: i=1; AKwUvBwGywEBnbsPWWVEoY6w6XYle/2JRXJ+C1KhyUZxLV6CT9egWQT0OWTc6s8ISrH2xLb5M1RzYrI=@lists.infradead.org
X-Gm-Message-State: AFuF++nPgv4XMSWE3ChsvWtVmKizm7y9MoLpxXg+mnCO65QKsGV4RNW1
	mrT/Tu19mOkhYzQXUgL/bh1EyN5OD1Y7g6FW4p2DmDWPUhHYCHUUIG2SmStGgH8TBm02bfOfinG
	tjFNsOc12o5RkbwSDLJAvsG+Q3/Hv/5S+x93TU4+pwfcCkWRybM+ekXDCTMKTM5gS
X-Gm-Gg: AYBFou2ThuSEQg9Ol2K8eZ8/49sBFJKnaQ9JLnnO7i7ZQQclNWOfgzEEej8GzBinkDy
	mpv5afr4QijZb4T/Eo+sjwqAYrVCEJdtpk9CGQkIh0xlQIsGKzE/QNu52ONFEEhjOzxqBUcab9z
	/eRw0qUAMN5q4rz2BeGZvIeWtTCugg61OaT8/Mg0v+LYftx3Rwyzd1QkIyod8HBvnLloim6pepj
	x48/rOVOxEA9qzZjeHMNYMtpsszb4hDuZ5VoRmYrqu19I49XQ0SkIRQvTAXHqlxcKc8Q9ks1jxI
	j4g5RASTFvICziTezSeTLTsI1bVvHpnnnIEgNdaQWXazrFZNSpZS3z1lxR/HV42oyZQj370CSn5
	eX7F3PUra0v3WeA2nNpyJVRlFO1krkru1ipQfhtk4IT28HZCHcGCb9G/n5GtXl5DALheofHRuxo
	JFlRbh7yHhrh1G
X-Received: by 2002:a05:620a:1b93:b0:93e:8774:fba2 with SMTP id af79cd13be357-93e9b7ec7d6mr1277725685a.58.1791496703757;
        Thu, 08 Oct 2026 14:58:23 -0700 (PDT)
X-Received: by 2002:a05:620a:1b93:b0:93e:8774:fba2 with SMTP id af79cd13be357-93e9b7ec7d6mr1277722485a.58.1791496703267;
        Thu, 08 Oct 2026 14:58:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcdde36004sm102345e87.8.2026.10.08.14.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 14:58:22 -0700 (PDT)
Date: Fri, 9 Oct 2026 00:58:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20261008
Message-ID: <afoydvkyh6kc3n55eet6ubszuw6g6q6mwtghfismxxxlvs62dc@cl6zxhem475q>
References: <5ca444cd-9d83-4805-88ba-f551576961cc@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ca444cd-9d83-4805-88ba-f551576961cc@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA4NyBTYWx0ZWRfX7h1Is3AZ/xIl
 AoUEVTTrim9qt+/DR1n/Tm6rQzrX6x9lUvhPGAR56gu4MrwGJDrB2EVvlH6uTDDq8OGh0H8Umfv
 5hHbigksSA7V/jM2jLcqULGdiOED8eo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA4NyBTYWx0ZWRfXzkXpqDK1k5pg
 MIPP4Pzc/gAfCZdydfKYIgNGWFmZtUm8mL3wDFFjfInOlh2rQ7rwP4/v6k7ItGI5Tc+wnjt45k0
 5bN8dLZC3hKctHTxjbzXZNNSkDSDShXYF+JYiwwRFy49uMPrsp1JQo8ikUB+qpOxIqJOi0tY/sH
 zebrUqCyLHub0F9dyytlLqMF635N4KVgmcWtjBdJqpsULw0sAIY2INsOtLKE2G5hZxfeSzaB6hT
 cBdgnO4PsEyRr7zK59pLNzAayyWddglwXNcOlF3aKZrsBdl9mpTK72cyYiFuTkEPbFaW3ELajGy
 ra1yJjSUvuLPXz01dCAJVgJPEQOBCNmdvPuURQpIt5TAimSK3SXXSzyDeTo3IIRXYGBWTGcEk7n
 rpZXSZcrotf8vjcwaN4gcId+ucb+HdtMbgU53OMtxM1U0sFvk3WwUGi97vD99VPeQfm1qMtsNmL
 y2I6mEvqqb0+TtFMwBQ==
X-Proofpoint-GUID: hP12rKg3RUeWeQs7hGPRg5TVmfnWPD2D
X-Proofpoint-ORIG-GUID: hP12rKg3RUeWeQs7hGPRg5TVmfnWPD2D
X-Authority-Analysis: v=2.4 cv=IqCL47/g c=1 sm=1 tr=0 ts=6ac81200 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=p0WdMEafAAAA:8
 a=qDMzh20vGZsPvAqjlPMA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_07,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_145826_926124_C86B0697 
X-CRM114-Status: GOOD (  12.75  )
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

On Thu, Oct 08, 2026 at 12:58:46PM -0700, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k firmware.
> 
> For ath10k and ath11k there are no changes.
> 
> For ath12k there is one board update:
> WCN7850 hw2.0: Add support for the Samsung Galaxy Book4 Edge
> 
> Please let me know if there are any problems.

Thanks, merged and pushed out:
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1296


-- 
With best wishes
Dmitry

