Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0A9C02198
	for <ath11k@archiver.kernel.org>; Mon,  3 Feb 2025 22:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cC+kaSqb9z0xzblfws8rbMuSNRKdorYwo/RDOvwQwEk=; b=hy5csdIEymsT1pxmd0vd6ELlM6
	nO7NiU+UBESkFb8YslRhPOHM/XTb+w3dXjgi+6GAbN2CVFTNrgJodcbeq6klgncVSzDVMsp6whhGw
	DcXy4+FMybszO5AgjkYgG+1ABt9Bf77N+GpfbWQQWFwWsh0i2EG8ma7kSYr4rliLbUimM9S0UDpEy
	ANQDU6N0kxKfh1foR9TY5n16VjAkD2uqfOg9AHX+tnSTB/orhhLlAAIcaJA4L43ly6L25F94/eLyg
	/HVD1L73h0xexWYeKGc4pLQXqYsd6HSQyrpwflaW7XZFLzWFYaC6WMjNEzKWvZddTvZNPTq5joYIc
	kmAC3kPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf5Fl-0000000GpHE-0vc6;
	Mon, 03 Feb 2025 22:49:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf5Fi-0000000GpEj-237y
	for ath11k@lists.infradead.org;
	Mon, 03 Feb 2025 22:49:15 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513IbbpN013241
	for <ath11k@lists.infradead.org>; Mon, 3 Feb 2025 22:49:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cC+kaSqb9z0xzblfws8rbMuSNRKdorYwo/RDOvwQwEk=; b=iERl9I7t3gKofhoJ
	O6KsY21MAxrk7KtEq36LQxqWJUF12uxeccnuSPoXFpbl+soJnpp1bOySSFVQOtw9
	pkkh8FkGw03SwMUeqTKeoEz1J8b00TR5HJJYGtSUzjXJKQCPBuTvxWl41KaaeiAz
	X4XB96TbaDepT92JHsHaxvJyJu/TwXUATdHqxsiDbb04FMDRr+yQTb70bnIVJeOc
	Gb3SpxTtB9qi9fJ0i/EhbjqgQqeIVPbZxft5jiHoOb39jThFWUakI4Z5nynEgYAZ
	PDZ3ikYsoVTadLJBKbgsXU2vGNEPvmHk88htQzhxdiwnD7Veer6oM3kHEWkvn2lF
	VTS/3A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k3890fjq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 03 Feb 2025 22:49:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-216387ddda8so106828725ad.3
        for <ath11k@lists.infradead.org>; Mon, 03 Feb 2025 14:49:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738622953; x=1739227753;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cC+kaSqb9z0xzblfws8rbMuSNRKdorYwo/RDOvwQwEk=;
        b=lP8DxAye97slUsTtrT+zOyuqDYj60ZABQ/xxuVTqii1zW+/6OCo8VSFDcZZRJqbCvu
         /Rseo7OMXl+mTDk15JgW9Q7Cz7635a7d8u1qTAm2eKvtvWpLkGiQShnr01PkoZmz95ju
         2dgZ+F1k9BWA52YTVLh2RuDuIIamuU6kr03jBQmJfQFU/qCLs5exG3D/2Slb0J2FRz/L
         Ql8VUVit4MyRt7+R1YEwnMYyXbY+dVRiwj0tNs0xZIQdYfAPRkT3LkpsdrS5TEvCEssG
         NVTiPzkV5cIOTgOuC+RQLq3coJPZrR6/SK4SSovS1y7cy4hOPi4S7E4UWcPE/uHooiDZ
         O7Aw==
X-Gm-Message-State: AOJu0YyrQNzdOWDXSQckYi///104zsuNzJYyKlMZW2uIzK7e40F1/QcH
	U6YTCNetxNrM0YGLJU3CVrrcxLWPKIY9Kw2A8wje+BYIWs5ETPWkAmm3VthLV32LWcbkhD/XyvZ
	h/Srf0QaSu4kIKYovJANASBg0eVbsvApn/PF5I5CqqbOeFx0YL1FYav86RJtV
X-Gm-Gg: ASbGncuw4eWnjxvUPLrQVbWgXYUBMqRmEIylbPBvhfxjkfrKEwA9bpW+ZPkpffLssc6
	Y9I3PTpcDBrPa3PaKBYtGHoIRJDUVPhD+FsajrpkG+0NSeCyJlTH2BbXFMvRT7ZpU6dESZbQFdt
	adMpinJLLcT9KsLUHc+56/14cgtDKbxc0U+VKpi9Nza7TgXWO8C6pDYTYyjebI5JW6WGISKU0DR
	eFoAQA+gv+1OlsUhSicefAIWUexczLyI46TbhjdjdKb8GTcEYfnznXtAgG6xEL7Jje3w24g2Num
	GnYN7294SNcC+DZ6GXtrdp/J8GrWHvXDKieUSe0+Kg==
X-Received: by 2002:a05:6a21:789b:b0:1eb:7da4:305d with SMTP id adf61e73a8af0-1ed7a5fb009mr39240593637.18.1738622953277;
        Mon, 03 Feb 2025 14:49:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGO3Bx6bSrb5h3bYaTWAUX61ZGQeNKnpq+AiKFZIJxlCeznLlrxT34+upm1lidcaJQyMF1MfQ==
X-Received: by 2002:a05:6a21:789b:b0:1eb:7da4:305d with SMTP id adf61e73a8af0-1ed7a5fb009mr39240558637.18.1738622952905;
        Mon, 03 Feb 2025 14:49:12 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ba353sm8887444b3a.112.2025.02.03.14.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 14:49:12 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath11k@lists.infradead.org, "Yu Zhang(Yuriy)" <quic_yuzha@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250124061343.2263467-1-quic_yuzha@quicinc.com>
References: <20250124061343.2263467-1-quic_yuzha@quicinc.com>
Subject: Re: [PATCH] wifi: ath11k: add support for MU EDCA
Message-Id: <173862295228.3734728.3310219521875555203.b4-ty@oss.qualcomm.com>
Date: Mon, 03 Feb 2025 14:49:12 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: mnj5vJgjDh6cAs8rBDONVHedlN5xj1z2
X-Proofpoint-GUID: mnj5vJgjDh6cAs8rBDONVHedlN5xj1z2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_09,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 mlxlogscore=777 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502030166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_144914_529423_5031F4C8 
X-CRM114-Status: GOOD (  12.20  )
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


On Fri, 24 Jan 2025 14:13:43 +0800, Yu Zhang(Yuriy) wrote:
> The current code does not have the MU EDCA feature, so it cannot support
> the use of EDCA by STA in specific UL MU HE TB PPDU transmissions. Refer
> to IEEE Std 802.11ax-2021 "9.4.2.251 MU EDCA Parameter Set element",
> "26.2.7 EDCA operation using MU EDCA parameters".
> 
> Add ath11k_mac_op_conf_tx_mu_edca() to construct the MU EDCA parameters
> received from mac80211 into WMI WMM parameters，and send to the firmware
> according to the different WMM type flags.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: add support for MU EDCA
      commit: b78c02f7c7104f1e77ade12ebde267e6fb388ca9

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


