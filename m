Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A79CD5BD1
	for <ath11k@archiver.kernel.org>; Mon,  1 Jun 2026 17:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=88zSpBHefWdrVhaVs9vohNFyJNRTMhiCBZF1tpTs2bE=; b=PJcCgmryWDNv2eE+I+hhIv4vd6
	+0jNXPhHDhxjLGwlm4MaQ/RRBNaExUGXHn7aBfj5U0rB38qEyTGQvUFbiRLCpW0vG65X7KduqqGIl
	TAPCYIH1AYURxyfZVPr8xGVJQJpfC2h5eFIdp64kYQwRPeqA8fXMgY4uP8d3rb6xQ6Vco6W2xBsAR
	bnZn66uIi0Mqu9HksGJE5lyTEThXTYyG6ZbXPfhOFXKhOctUrogg5WM7Acdb0C7Y0at5hQJPDT06X
	WeNoo7/qPKDaBGIZ84aLGBKU0UKGTEGTGXvN+/CCoafBP6gG2cFDjwhGzVNE+NolZgw+vvc2zvt9w
	X2lbHEYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU60C-0000000BWwo-2yan;
	Mon, 01 Jun 2026 17:00:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU60A-0000000BWuz-1043
	for ath11k@lists.infradead.org;
	Mon, 01 Jun 2026 17:00:35 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651FJaWb4065409
	for <ath11k@lists.infradead.org>; Mon, 1 Jun 2026 17:00:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	88zSpBHefWdrVhaVs9vohNFyJNRTMhiCBZF1tpTs2bE=; b=dCjZBY5Y8IsquOfy
	kvJGrG8ih9yWu5OnllWj39TFFfau7ct2Amaog5PDHVPMb7nCXcMEvLm6AXZPPF3e
	fyg0H9HuLMhvvgxVSmKHXY5S9aybF4K+amoc4WZuwtjHrGXlMlF1aWq5fe6ZhEFl
	CKlTW0PDc+vA8zKqmYG6ZvR0GEmxUKZCgpITzRxJ1WIyg/phBJs20Vk4++9lPR8G
	zA0rxA3Q8XmCvVB1DH6GCman1jZnhTO7JoFQBlzB19Es65SVB9Zsraew5hiGpOz5
	8/nLcIhF7Rgg2ucUWmAdM+Vxzq73wTDaGscMxqybCFiaHyKkVL9w/H29NXGmN18o
	VAT8eA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6swt3f3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 01 Jun 2026 17:00:33 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-137ea73393cso2212443c88.0
        for <ath11k@lists.infradead.org>; Mon, 01 Jun 2026 10:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780333232; x=1780938032; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88zSpBHefWdrVhaVs9vohNFyJNRTMhiCBZF1tpTs2bE=;
        b=T61SwzWXOdoJOiBRMH+QhfUIiC8SRHcH1TD6SOjrARor/vEEAb7F5UrK39d+wMjaJR
         jobCKd7V00JK59N0zYPjPWRoxYqCg6KoTVhjVxs3vS7hhOv3Z6mohdz5CPIcc5H+xxc5
         ynrKGbtdQdNuDgAfezSZgFImiRWvE4SxBHk2kpMTRZDZV4XOxcmwfuTFkRwWBMsAmp2p
         wIt+712lPazO2y9yYFG5C2bQcCvY06sN/v04zzpiERhmm1Rvp0TVCCshDNFhv8UBkcXo
         tO+0Kvc1cc/aTiP/xxdTtMc7KOtEZCFme7Mzvb0L/gfIYbTwagvlL6svFergngMqLZ4w
         dr1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780333232; x=1780938032;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=88zSpBHefWdrVhaVs9vohNFyJNRTMhiCBZF1tpTs2bE=;
        b=DvizrrFwR93tSpXpD/nm1v5dEbOBYMFKpuIXNSRqjfF36kUHZWXhJ0I80uTi572Zzi
         THYLB5pL1o+KvvbNioZNQk2R6TQMroIHtZo6kSEdWg9Xa2b9joPHQMrvLk5NfOI7oF2s
         6SAZy6z+svCrNOGIgmj8iCwgp/Oj8uTnpOv6n1bjJYjuVIGrokhlMn0QP65J1xQYJjLY
         BcdvA9qqB2foGC6SZ3ud7GeuUsW5LnX9nNoaPgIjGD8jsQUu/QMB0XkAd2UMTrV6bpYu
         EE0aLJB3C5CbNEUaCe40enkc8Eqok4WLHJMcuvoHTTbpJbR+icYbC9K6cO9lWnU379hE
         uSMg==
X-Gm-Message-State: AOJu0Yw+sCFGRlOhtK9nIDef2kC/FpeCf2hmDHESo9m8Va/83NVnCHjG
	InAiqHO+ozuoeyFtz0ZfWMQ33RuVZuxfPbvyJzlAoEbwYEsOwbVWtNy5yKCPkvbOQ1IiqiB0JJ/
	oXPPMpnqIYM8wO51kfJmXdSeQUARRV8YejrIR6b+C1MPB6i7om50ubJV7MpflGV6oj3fPxezL
X-Gm-Gg: Acq92OEZM5Y9t3aVVeSiSGWUurKNIw2GdkPxUCVD+V2WTZ8KAfpNpjvlDIjQrQ1ivMQ
	bds4kLRLd06jiuJgUnmnalsB1seJ+S2JnA2QCi9m30LLnb8rHUfDjZ1PiHL6G0HT/9LxG270HDx
	OtX5BrZd0hK4K5NAH4JD8Dyw9Szm18e4PxuQl4jRGJ8hpPPHTCVlKBsOpQ05+bCwfo/zJACs1+N
	BGk+lkQ+Gb3BJ52R0kulPgqdCxEAiTQ7iz74EDwK6I2ozrFvHqHHVOhwL1DhdXw1mSg5fGAbKMI
	36Z1Njuv1TGf9cS/bD9KqH7KckchWkf0QzN4Xk+rN7lWMSYtUgF+Ansus0mM8KBs87t9FhELLut
	m5y0JJr5kU3I6VpcK8F4jLTNtKgE6cOnsKrjfk0dZ7WGSoPntN+KYkZ88FhXh3C0JFPXu7BhMVV
	aPv0NBom0nTVU=
X-Received: by 2002:a05:7022:b99:b0:127:33e0:ea44 with SMTP id a92af1059eb24-137d4284c55mr5447671c88.29.1780333231701;
        Mon, 01 Jun 2026 10:00:31 -0700 (PDT)
X-Received: by 2002:a05:7022:b99:b0:127:33e0:ea44 with SMTP id a92af1059eb24-137d4284c55mr5447641c88.29.1780333231020;
        Mon, 01 Jun 2026 10:00:31 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137b3c69bdfsm7151625c88.9.2026.06.01.10.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 10:00:30 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Wei Zhang <wei.zhang@oss.qualcomm.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260525020711.2590815-1-wei.zhang@oss.qualcomm.com>
References: <20260525020711.2590815-1-wei.zhang@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath11k: raise max vdevs to 4 on
 hardware with P2P and dual-station support
Message-Id: <178033323035.2045173.12176429326839245310.b4-ty@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 10:00:30 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Z4Hc2nRA c=1 sm=1 tr=0 ts=6a1dbab1 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=bzN_VnlbJtnZpAVkCYgA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: NPULU_B-JMpKs2IXN23HafiT7hwhIfU2
X-Proofpoint-ORIG-GUID: NPULU_B-JMpKs2IXN23HafiT7hwhIfU2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE2OCBTYWx0ZWRfX8cmLXvUIKBFb
 COOuKvmQElJU5R0z9ZzdDvrd1G1qzwUWkFuiRk9gGzwrahb/oBFI7laHSZVLwc/yTgCvMskQrPZ
 5bFuoVaHuxRUUAxMlZkKzY3jJVDXvcXGjWQXgPVUuHNSVAFznhCToNmeIZhDLg59hn63MOjBvxJ
 5jTLh0D8H7UYhhbVODxXx3b3FWxBe2eNpJhGYF6ugQgP60WB/8fTYKr2mw9jk77NJYYnFCgydgz
 bDcPtr+E4W0pdmkneQc3X6Nr5toKmST69bdNzKRX3gWCXESKfWFyxNWoTLPOMt4loxz/3+OF3CN
 rdm9Ii/Jq6xRTl+Ulkq1oG1v2f576J++orHM96aFmd41oq2HOvaSkNRacvXtX8K1seit0uY1h3b
 2Ewk5Tz3RtCGZz7v6ILnWX9/2xQbMqxynuwPXRG0dMxKmR83b8XJ0bILx+6aIZaJWOJLTlQvy0e
 XjEWrvJ7mrSE25iOkXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_100034_423380_CF516D21 
X-CRM114-Status: UNSURE (   9.54  )
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


On Sun, 24 May 2026 19:07:11 -0700, Wei Zhang wrote:
> When P2P support is enabled, wpa_supplicant creates a p2p-device
> interface by default, which implicitly consumes one vdev. On systems
> managed by NetworkManager, this interface cannot be reliably disabled,
> leaving only two usable interfaces for user configurations.
> 
> Increase num_vdevs to four for QCA6390 hw2.0, WCN6855 hw2.0/hw2.1,
> QCA2066 hw2.1, and QCA6698AQ hw2.1 to account for the implicit
> p2p-device and enable common concurrency scenarios such as AP + AP + STA.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: raise max vdevs to 4 on hardware with P2P and dual-station support
      commit: 209887467581116a93490e6122b87b6fe0787627

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


