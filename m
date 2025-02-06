Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DC5C02192
	for <ath11k@archiver.kernel.org>; Thu,  6 Feb 2025 00:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iTxg7nKuffcT4iD2zKX1r6AOCSGMFdncbWDtotDGgbg=; b=at6YcYt4xNnR+iptZmLl0LvIgL
	lbkdR+7zEsOvV3rA6UgRLw4c2KP2C5Nj57CXwDUCOyoK3YvSXFK65HAh66y+lClpYHIvpmXwk/Mf1
	ZbhB6dsvlakjFHNh1rmzD3g1ppbY0of5+TpkbsRr/O1qzHAzmHUbfBrEvwGq4kK8Sj2SeyXUsTNqk
	ZfCE/zJ6aR54Eav+jlTElgVeXTvdabkBZ0B8CDIBlcKP4JKPJ8CcJ/sk1ixzSOefvB1NPMrjxgrU2
	66lcZ0EsZ/mT3EDp1YfkMs5/px3/QjdcqPN5AJytDYFK5Y6S2eZ6svCtUNtZwrW6vWUiil7eDO3gF
	BcYFfrWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfpZd-00000004uXK-2wl8;
	Thu, 06 Feb 2025 00:16:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfpZb-00000004uWj-0E2X
	for ath11k@lists.infradead.org;
	Thu, 06 Feb 2025 00:16:52 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 515BOaIW024533
	for <ath11k@lists.infradead.org>; Thu, 6 Feb 2025 00:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iTxg7nKuffcT4iD2zKX1r6AOCSGMFdncbWDtotDGgbg=; b=Nlwf+sxLd5iS47mm
	RcHJW35NF7mbdEHB5SEJSv3hepYDejIi1eFeoHH7UN5CMZpjyKKxzkikpgCnIXWM
	LIoiFxBaVr5KzxJ9+fclU2YES1tJxlabjjaoL78raIg75GmvB59Irnzaj2HmM0NF
	eXix7PPHHdVBPj+apG2qR9nKEoYhTIXbM8868VsXlhZpAUnFVs467h2WrZjKk0Ys
	F8+bx0yNLgwSsw4sbTZtyOt2G7yDhLvJ3Pz5HtvEX6jdR1ozic1RJBMcI/sQCnYM
	xjkDHaMc6tWDIIelPS8mF/+OTpjE6eHf/vdkiTLMrEtDA/6xgAH/b0yV7a0Yh9wF
	I/XQiw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44m73b9pvb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 06 Feb 2025 00:16:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-216387ddda8so7798915ad.3
        for <ath11k@lists.infradead.org>; Wed, 05 Feb 2025 16:16:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738801009; x=1739405809;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iTxg7nKuffcT4iD2zKX1r6AOCSGMFdncbWDtotDGgbg=;
        b=oCctEmA5vnz6X0o9RklsvAIfnKFMuDetzh7fayrnFfCJFIGm8zELNaEUJ3x9t6kKtj
         UYmFwVpNmIeav1yTOIz5aSysAWa1rJhQ4EVM9bsK9PGDtvnUWiyKDlL2emGpeNkUCiY+
         fsOkue+fdBdzw3hwB6nGBPwFP8NQGBJkJ33wYhWl9UT//dbRoZrxjsZp76mMSL9k/lVm
         c06wabNDCkInwJOnGxGGeHBiK0qdI0BtwaOgaJJwH9fPb0L8eFC85vhPxqayv2Cef75m
         Q8fSZKnmySNBz4EyWtDNZBnItQRu2jouOIjOMRnX3JiOTYVqUmUKIJjxg5yYvQFI1qzU
         WAGw==
X-Gm-Message-State: AOJu0Yzxbtci6UgeJsapY/FUywfJmHR6xfoL3BcFzn+FcCUXTzTKDUFv
	IZM+vwdaOCj3iWHqXDomYXMiSuMV6iErDbqwA9IbnWBLguyxnHIGX8ywkMxZL9f3jMBV2pU4CAl
	x/Z+8qRzwslBbWZ6jEUORNqrn9NlHtLF3QNUMhXYjw/Trsw9V27IwP+qQGa3rm9b4K0Ce
X-Gm-Gg: ASbGncvn5QsTnN6stcTkxCXWvJANSWzJt96Tj4OFZ8o+StORuMGF4fa2sJ4GwrM5DFQ
	3FOyCO14vn3O6LIJW1rG96nv+sAXP1kt3EaTCLDPFhDfbOmPW17n+iawY9+7zI1H6NTyhG6UhOg
	8GzbdFOQpTqY/QRyqmIwnzlOlw57Hhnwh1bEBg3XiQILr6NzcGngx4BykWuG1xEJcTi6GhrTGFw
	Dot8pt800RK42N+Xsq5it6yaVCiy+dT6dtk0UBPxyeDaLyGTbK2/cYw7G850HhJHkbULzMWV+38
	F+/A1S8cmEGJp6iH+NRMqWS8845bSHngeRch6iIfpA==
X-Received: by 2002:a17:902:ce03:b0:21f:78f:c17a with SMTP id d9443c01a7336-21f17e4ce67mr81713435ad.20.1738801009030;
        Wed, 05 Feb 2025 16:16:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJ/QvgK5grrKymF4ubh6+iClejBycX3N8Bto30t1untzbWq0H34PSSoTDqIHX96ZFYWY52sw==
X-Received: by 2002:a17:902:ce03:b0:21f:78f:c17a with SMTP id d9443c01a7336-21f17e4ce67mr81713055ad.20.1738801008595;
        Wed, 05 Feb 2025 16:16:48 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f0463e770sm39641685ad.165.2025.02.05.16.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 16:16:48 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath11k@lists.infradead.org, Kang Yang <quic_kangyang@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250117061737.1921-1-quic_kangyang@quicinc.com>
References: <20250117061737.1921-1-quic_kangyang@quicinc.com>
Subject: Re: [PATCH v5 0/2] wifi: ath11k: fix data out of sync for channel
 list for reg update
Message-Id: <173880100793.1503921.12113647130337572024.b4-ty@oss.qualcomm.com>
Date: Wed, 05 Feb 2025 16:16:47 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: gT9BswYjL5PdAt7tCA6icoKbRbuyTBDL
X-Proofpoint-GUID: gT9BswYjL5PdAt7tCA6icoKbRbuyTBDL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_08,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_161651_105963_34ACB4A2 
X-CRM114-Status: GOOD (  12.58  )
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


On Fri, 17 Jan 2025 14:17:35 +0800, Kang Yang wrote:
> Currently there are two threads to updating/fetch data of channel
> list, and there are no synchronization for the data, it leads data out
> of sync for channel list when doing reg update.
> 
> So change the call flow to make sure the fetch data running after the
> update data finished, then data of channel list become synchronization.
> 
> [...]

Applied, thanks!

[1/2] wifi: ath11k: update channel list in reg notifier instead reg worker
      commit: 933ab187e679e6fbdeea1835ae39efcc59c022d2
[2/2] wifi: ath11k: update channel list in worker when wait flag is set
      commit: 02aae8e2f957adc1b15b6b8055316f8a154ac3f5

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


