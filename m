Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BEECD13D2
	for <ath11k@archiver.kernel.org>; Thu, 30 Apr 2026 21:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ORbwj1deeV9w7+GF7fhmUVzGC2pR+Jjv+JopQhPjcs=; b=Xhj7OqACKz5Kvo1RJvnYh/64rE
	YcciU7Q7qMHVXSjfyoP7GJ1r5DEK3POI8ZQcBoxunFz2KeAqXaHpMauVdVNVwt3oOzZA9FidDItzG
	QWtiK4Sp29gxKJQsAhmnAtu+gK1knq5zLw0gTetF/5mvGi+Zgwdh1lYD67w/hqhkfs3uSOe21i7cC
	OVcnhfIYd0YGypxF19cdam4Ih3+QcIhMwsTzLEKzXEmgbCd+o3gudToFV6jRC/X2dCzUrFOc4sAh4
	7V0ltvWxUFqBo8oUVAjgag56+ob9joSrc4q7BHoduUTSKAF3VQCtGmj2oQGt3QcVqVOvuNNTa4ATd
	X/iXSNeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIYyH-00000005z7Y-38s5;
	Thu, 30 Apr 2026 21:30:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIYyF-00000005z4f-0Vqn
	for ath11k@bombadil.infradead.org;
	Thu, 30 Apr 2026 21:30:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7ORbwj1deeV9w7+GF7fhmUVzGC2pR+Jjv+JopQhPjcs=; b=X+V9VVu75oY6lkTd4OJfm7tBFH
	5+y3krEakoOP90t+CjMaYXQo+oVTkOo14FnUm6LRENRepaEtd3zh3/CRnhenhFwE3kuJY9Saf9dK1
	pVzjJOfK7xFxfZCx/wemgX8UO7nV9QC4AntEgw0P3JO6OigibX0K9IqyQoaPPm70ASo5K8RcPDN54
	WzePn2x6cBLxRq/PbxhzyQr+K70iqNQlQDGIa3dQmhA+wyxMPOtMqmosun/Btphs8VRfOuJ7e91io
	1lPSHrv5sAYO8qZTKm3qhbUvhjd43YW3kH+zHoMpHZNwxiCNaKvmCKezkFqcxFnNIo3PvN/iSlIqW
	PjRnfG9w==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIYyA-00000008B7B-3ETV
	for ath11k@lists.infradead.org;
	Thu, 30 Apr 2026 21:30:53 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UHMkZ01820431
	for <ath11k@lists.infradead.org>; Thu, 30 Apr 2026 21:30:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7ORbwj1deeV9w7+GF7fhmUVzGC2pR+Jjv+JopQhPjcs=; b=kKwkiZEKvwM7Fm0C
	GYBkEu+VLUWSTWy/8hbRaIhk0M9p9i3OG5XvQBKSIUhSF5t3l5ESPRmIiScdUVZc
	R46F1jY6TaQtVn0RkMjreRJGf/zaNIk9+njZYxeoeD7Ak2cQ/I4gPt5ARnvInVpl
	wt+FnwEwOaHSkcyEjNxvJM3R8LKQhWPfhipOirUJDuYqx5bterrj6cnWqavbRWuZ
	0GxWN5e7tfYWcwMtinUw3vG+uSfQTS272IEyYB8WfWQ0VFSjh2506CuHVYakf7yH
	chO9sLl/4KdwaT1SFgB2iVZ4SI1KHUvI2PY5z/0QzCh/HR5YgTDEHyanvxabNI7v
	N4gleA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv6getp9y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 30 Apr 2026 21:30:49 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so2955066eec.1
        for <ath11k@lists.infradead.org>; Thu, 30 Apr 2026 14:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777584648; x=1778189448; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ORbwj1deeV9w7+GF7fhmUVzGC2pR+Jjv+JopQhPjcs=;
        b=LSgsKLwlDICINGb8ZhETf/YbEKeUntfWDslmSkwViv+mJPMYL7lFofAfbbhOmSEAwV
         U47Jnqfy8JhPb8KDM+G/QD60aITAMb1HpU0rDyNVxdYUH3arGiPIANJLx1CDEtR9ugyu
         GoQjS6pUfxSKRyY4UGe8oqcRzlkR86D+myk9IHkuwskB+4DrJXj6oDrTvoTH1chiNUhi
         5WISvxpLdNBfQQYAK1yjIX6Je2jpFa6g9gp/STPtHDfeV7JCx1rKNVLATFi7JKEFhGfe
         dZefgGitzYja/UkeILpSuLDbtPjnhlPvwJfo37k6mesCHt0ZrY359aet6OeR9aomzMJv
         QbVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777584648; x=1778189448;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7ORbwj1deeV9w7+GF7fhmUVzGC2pR+Jjv+JopQhPjcs=;
        b=rhFZCaa/rA00ro1ou0wfmcY2i78ueeSS2ol/n9jN5c2r/JBLokhKjRP/z5+5+uWntb
         ay51+2NWXZSOY1ThZEMBytl2TKKgTx4/welIXk5UFsLtHN178JKPiL352rb94PacC0Wg
         u6ki0FnigSmy+8cmdNJpndu8oH0pMFHj8KwJRpCcaKUpLC9hs68eHSywILh//oeqHMX6
         SaOK3XQ2OucGcANRKYAmI3h/hYMnK/GbZ8CIYet4PJBtX5PtnY0gJOVt2DHYs5+Sr6PO
         z2Yh3xdMgCsww8uc49qGTRbK9r8jcWerJENSe4mRdKVTlz07eSm4DKDTay+0W+TOr/JG
         Xrlg==
X-Forwarded-Encrypted: i=1; AFNElJ+A2WibcO/t6wh5OdfXNVUA5tJarj8GUMQa9qFf9k6E1Am43ZbHWmWhILpXdbtU80IW+yDOe1g=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw40eqFfHtGuPzjIP6pauI1OlsKLaTSpuHOjx2ezaqV7rFgp+xU
	7skc/wwkCzU/T0mgSUgyWuNb0B0iu4fKYFdwOhh21KErobVwMEJRMoa5DCRczeFOKuN2wutuAZ1
	KTi81Ty9e/1M2BvXmLKGX2SpH4xK0PeeI79mgN2jaFxqvkCrlduD8R32KytMykhrD
X-Gm-Gg: AeBDiet2pCKCGjcqsLid5jhBk99rzz/C3sPnk5epLDIPOZVR+pybi4ug5kUXLo3doak
	pJYnioha/qNPPFbWw5OWsk+3J7vatT+xVglNrU3wC5Vw4maSV144DrLXbBZ396CF77VFGgcamRN
	CkGejbUdRFgH9DZn69iYNYm0z8LQFwPFwTBeKJCzz6gLlpBYfrV5DahTplt1Jln8lnZb4p5xJIe
	HDNAi6UWAS+gRiEO2LIFfGy4J6fjFRlT2wr8WA5hpx2cuw5uAVnewhfWNUgXWYTT3k5AKCbPIaw
	CvTU9JiQsyzmcz0jWE4c81SMfYsh8g8xgrjLgcrAhHYdEQwIdjwQo27u1b1UkjUViR/cQf49+a1
	VSF09AR+mqfz5/vV0LIN/YI/5ha5lm5wIEO1Lu4zEHrQ/hWksBuiwCqI/7NV13rrfctWlX+BnYt
	cc6HkcqgbzTu8=
X-Received: by 2002:a05:7301:168f:b0:2d9:cfa6:3d34 with SMTP id 5a478bee46e88-2ed3e9749d9mr2269191eec.23.1777584648399;
        Thu, 30 Apr 2026 14:30:48 -0700 (PDT)
X-Received: by 2002:a05:7301:168f:b0:2d9:cfa6:3d34 with SMTP id 5a478bee46e88-2ed3e9749d9mr2269158eec.23.1777584647794;
        Thu, 30 Apr 2026 14:30:47 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee38d79eb9sm2504861eec.8.2026.04.30.14.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 14:30:47 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        ath12k@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: =Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org
In-Reply-To: <20260427070040.17928-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260427070040.17928-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] wifi: ath: Unify user-visible "Qualcomm" name
Message-Id: <177758464704.1848985.17511825714813027637.b4-ty@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 14:30:47 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=f6V4wuyM c=1 sm=1 tr=0 ts=69f3ca09 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=haabeQbpXhb7lDqDI2kA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 5WJ9lizqV56SxdBZcZyQJuqhCjTAgnOZ
X-Proofpoint-ORIG-GUID: 5WJ9lizqV56SxdBZcZyQJuqhCjTAgnOZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDIyMiBTYWx0ZWRfXyqpze4AnpNJR
 Q0wDaOY79Xic8BXftDCLSTHWYh0Z2TG9Iv3vvkXt/AGDRBT14q95Z5G9pF5/RQOUXVx55v4dI41
 sHIIUvPnTXiBU3n0oXxLuAFDji9wa8yN1zx82p6ce2AbvgzLWhL/5aNf6nVZABp369SwtuRyMN1
 jkQMfLQA51lgirVp4PoaC4ITrYD8Y9G5ngYwofgly9yf6Faty5RqyYQPGC3C7hWqXFb2JtI5r/+
 ESH73HOME42eOf/ph3/5WsjsEyGkMDKTWSE6UA4J4V0O+qnBvAB25xT8HjuDokABMsdU9fsFMt/
 JGVizNe9z1HBmBilztAiCQJTRyX3aQ0WiMhPu8NeKAZaCdzyQVx09kaxpEEycs0gMxtAebed/Fi
 UOePCZBwz0GIQe0abVQA799CwDJ9MGsYgGY6+tGNf9UjxtCeVAgExQoGY2KNp0HK8zpkXuFmRTL
 b1rWZdgLYTWuO3fbFtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_06,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300222
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_223051_779311_77F3C7DD 
X-CRM114-Status: UNSURE (   8.41  )
X-CRM114-Notice: Please train this message.
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


On Mon, 27 Apr 2026 09:00:41 +0200, Krzysztof Kozlowski wrote:
> Various names for Qualcomm as a company are used in user-visible config
> options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
> "Qualcomm" so it will be easier for users to identify the options when
> for example running menuconfig.
> 
> 

Applied, thanks!

[1/1] wifi: ath: Unify user-visible "Qualcomm" name
      commit: 2419d92ad387ff34376e7c3afc300cff651038da

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


