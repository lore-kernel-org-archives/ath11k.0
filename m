Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3306CC44507
	for <ath11k@archiver.kernel.org>; Mon, 13 Jul 2026 16:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/SEIS1vL/+8nOxtKCLA1mNY2y1cK6U6iZy+GY0kR19c=; b=VSbuo8/d5vMVk1F24yKM6tQ31l
	gCaI1aDC66V1HozotjVniPfyfs/LhueSEj5gkLdbd5nD8gH3PFxhF9U+3blEye/Qv80jNiBiKcpoM
	+sUkdDnWo/Z5PJ0RH6eP254UJlE6kWKhgrO1Ou+dib1F+OSeQEPvNa8sZ2spQXWRi6sbk6JFpA42+
	x3zW7R+nhcEEVEkPjPHSFMb44cittuS7uLfhBbHIZdoqwZXIma0CmKXiMghoOCOk+X/RuSePCsid6
	kQUg1hNLG6RM6o7ZSYS1OzL0RbgEQbJJcFMBoHwNlVoLRkOnekYQw0e4LVTewoWuzTRWX/7EF1G4A
	38e7zOSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJK8-00000009vZW-3jae;
	Mon, 13 Jul 2026 16:16:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJK6-00000009vXK-2k23
	for ath11k@bombadil.infradead.org;
	Mon, 13 Jul 2026 16:16:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/SEIS1vL/+8nOxtKCLA1mNY2y1cK6U6iZy+GY0kR19c=; b=kWhRQzbRw6nPN5IkdmkCaZwVp0
	RdoVkRhhChBBl3sJb5GCUphZtIgXP92rkTuyMZB0JHP7mNIjPovucdaMykhSTmK1boWEzpuQUM2iA
	UuR7CuKT/1ALIqVF9N1hXLX1gke+k6QUJnFnodkhZBmEg0cXQdD4FyzgSwd936SaX3cSQE4KXlVuW
	o3P0McekCNJlZscJNH5x9SYjKD/fNVdavcFQR/06uBALpevq9McQDNRUyqPQ3kuc/wbkMtaUyMhqP
	gqkEoh6+3ab1cQTlOr+yyERuFWeKZntG7gATs/dOCecAm3RxrOzPrjaIoo95uCnegffwvs3G80EIL
	KqYtAZDA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjJK3-0000000BpGP-16Sw
	for ath11k@lists.infradead.org;
	Mon, 13 Jul 2026 16:16:01 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DG5HkH2030820
	for <ath11k@lists.infradead.org>; Mon, 13 Jul 2026 16:15:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/SEIS1vL/+8nOxtKCLA1mNY2y1cK6U6iZy+GY0kR19c=; b=EzLrYT3Zxjwtibuk
	TyoLLNMqGzSEyXeBi2kgCSRqSD3boQivLX0NERvsUnK92Bb32PXuhvot0R96N0R5
	/h/G9pCNy506wiBZIJuJwY58jptG31REWXNxiZm3yz++paCV0tbJ5rqvihA0HrE4
	fWtCqxWdUqa7y0BASOc8pMGqB+aCxOUGUpNsLk8pG84I0nLm/Y+fyzEb88fXU1dJ
	Z5NFfW/ltI72MxahmRnZWTedg+1ZRRs09BfLQ8dQifS9uutrJVC4Kp/YCbdDyh/0
	jsP9JobK7cC6k2LhG5JBOvvXwhheGum0yqwScI8TMHfmmTLzk8MxmijRfV/VRTKp
	CnF9YA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd37x81d0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 13 Jul 2026 16:15:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso713198a91.0
        for <ath11k@lists.infradead.org>; Mon, 13 Jul 2026 09:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783959357; x=1784564157; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/SEIS1vL/+8nOxtKCLA1mNY2y1cK6U6iZy+GY0kR19c=;
        b=kfZTjokUyT9tsROWFqNlFDllQFlFzJ7ECihW78xrIByHo/rBD9ZG7rMbVQlaiKua6e
         Ckj2m4h/DZB/jniUk9bay5Oq/Ml8jvJwll3tmcZFqD/4CCZrvSqjnZczG030W97g7krZ
         ICp+xas6s7uBEwse8ZA8Hdi1X0ySp2YxPb9up234JXhJStWycd448+Ue/CGGX5rz5aQk
         9FurO0SNAIoE/zjI7C3vjwQFphdQeHWoog1Murq1o4nHHiNwqyFwGdEoJk09LqTFr8np
         Cn9Zj6a9ybWupH1PCarbRt4zv/+c1TO+znFzafYmPzpNjY+ny36hyWAHikGXAbcp7F15
         C62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783959357; x=1784564157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/SEIS1vL/+8nOxtKCLA1mNY2y1cK6U6iZy+GY0kR19c=;
        b=loDSplISVqZ+oedCH65VNnmRfTBa4kEvGKp8uP0WtEtFm1E2XEzNW7kdArWDiIClmg
         htWgQqB8rEEeq62nzdJ3O1XfpXssh4gI1NBv2smrxXxPZ+/rkGXhGyz+0qBV78T4HAre
         d4stb4c1jO9OEnMLJwosUcRsHgqMJ1QikBuoYETMeoaLHaeUyDr62xyuSmS1oc11bJ7d
         pjw8hbNqN38JqnSBhlPwR/wCCQgUuwuyPiVkoD3zM1WzHosPPvenQSzpManvi3BCyxnx
         24WoUigyG8KNsFw1/g3lsKPfExj0oW31YgOhgmAfuWFP/QzIACNpWxF/9ZDNdPZBEtOQ
         gKyA==
X-Forwarded-Encrypted: i=1; AHgh+RpO6wYl6LTxTao35LqcjOBgTfjpvlIvB0ZjYv4HpnU8luqWf9r0+kc3vXatXU0iSMFQkoqRR5k=@lists.infradead.org
X-Gm-Message-State: AOJu0YwEfZwzenMnORa+zyClPfvyjyGUSMBlcadbl0MCtSWjmfojBhkU
	3MVI7VlTpp/f2V8CyVtjkQsGkPemW1rB9xgHZ+A7TBATA/2sjDDgeIk1MwyhKMHFb3ehKxfBhA8
	Ds/61Smzga7xn4HnyXZdh+xZOww4k7Vhjp2W/zkAP0MNkMeorZBpn5LUH5tAvcixCh3cM/Us3
X-Gm-Gg: AfdE7cliKTqzB8Ay3JnEFK1lzL8Jk8gHgKk/qn1nhBRvkDxhdpo6HwSF+j+u9en2XBw
	RSK3+bbyi5zNXRaDhe5sAmhvnLnKrkfDDpXd2R4uGnWNV9c8tAnkyINs2+filSvG8m0VcyYWfTR
	MjVgtCaleWhZjlyqQ9mDjfMwkSFVe6Hbsy71rMDMA3glG27vGKkitRxfeASszESS5kGFxQXCbMY
	KcgahpfhV8qxyUD3ft5M6zK1T9jAb72y3flZezv3S0ZlE3fs4V3hzcUoJr5DuskWcK76stiKC5l
	TOuDLawcDRMFNBFqO+CDFQVCDxeOurbmRoG7oF0BbMMZjIT1ztEmFXHKGaqez7Yev4lhc7JehCX
	E/Lrp0htqZedRrgYoHCLAAnv6WPG/dO5sfwL2WLTWCz7d+HOyJuFJrZpgBAZAKgsCPA==
X-Received: by 2002:a17:90b:3903:b0:387:df8f:1409 with SMTP id 98e67ed59e1d1-38dc77d8a8fmr8610356a91.42.1783959356557;
        Mon, 13 Jul 2026 09:15:56 -0700 (PDT)
X-Received: by 2002:a17:90b:3903:b0:387:df8f:1409 with SMTP id 98e67ed59e1d1-38dc77d8a8fmr8610324a91.42.1783959356092;
        Mon, 13 Jul 2026 09:15:56 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3118389d9bcsm60877039eec.20.2026.07.13.09.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 09:15:52 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 09:15:49 -0700
Subject: [PATCH ath-next 1/2] wifi: ath12k: Correctly copy the hint BSSID
 in WMI scan request
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-ath12k_wmi_send_scan_start_cmd-bad-hint_bssid-v1-1-4ffc4a472992@oss.qualcomm.com>
References: <20260713-ath12k_wmi_send_scan_start_cmd-bad-hint_bssid-v1-0-4ffc4a472992@oss.qualcomm.com>
In-Reply-To: <20260713-ath12k_wmi_send_scan_start_cmd-bad-hint_bssid-v1-0-4ffc4a472992@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE2OCBTYWx0ZWRfX1VsNJW3x3fbI
 G88CyYHrRc1b3n4R8Nvc14valD0Z1t/3eBe0mh32OXKxE9cLQZhrsY00zkce6YdyBNSl6M75BQD
 QMtQECxOTgUWNjPzG+o4dSV5imgvnjpb1AZXoPDLRS8RjXoON9+Fb+miygmX7sFQn0T/v21xSq4
 ARcPt5EUrWIhEWqDbFytKLhT9DTa4P6f7zYFAaXpJY3JCP8e1NwL2VCwYQ4L5xSnuxDRvmoW5HQ
 tyCdHRTxGf2zgBD49hzB0dxlwKPoIJsd+v0eH2sBBdKKjzTlJoPlF1Cdt4gi2WSdeyVrLEYtsOc
 8S5/SBsjhjvOieDtyd85CELhI94Gz9pnnnwvvv/+scwnyKkTMDxVjEGpiUm5rPaFoTZO+YcNuJF
 x8IWQSqivDBhVZiN6qrI1eCfc+Td1SAgXOe2aKJJdhBC1LwQA4s44tEY/JkYP1Lx5F64bzL4mRD
 RFDSn4agwRdeatg1wzw==
X-Authority-Analysis: v=2.4 cv=BNWDalQG c=1 sm=1 tr=0 ts=6a550f3d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vlSVdC5Z7QfGigt1aOQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: IFDgodHM_Wkp3K4Xtx7Z7hJEYG6sQ-hi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE2OCBTYWx0ZWRfXzj18OhCeaneT
 DmqK2QHjrvUfrtKKbnVTBgBHk22bjMHFJlHl84om2/NkZENTXbCp8B/1orfKbRJgl+a8rwlyUCD
 fyc6+f6VAAswVFgg12uRIZrXhErEuCY=
X-Proofpoint-GUID: IFDgodHM_Wkp3K4Xtx7Z7hJEYG6sQ-hi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_171559_747241_F032C2F8 
X-CRM114-Status: GOOD (  13.59  )
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

Currently, in ath12k_wmi_send_scan_start_cmd(), the logic to populate
the hint_bssid copies the BSSID in the wrong direction, from the
firmware message to the argument buffer. Swap the parameters so that
the BSSID is correctly populated in the firmware message from the
argument buffer.

Compile tested only.

Reported-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Closes: https://lore.kernel.org/linux-wireless/afbff608-a005-43c4-af76-968a58bf0cc3@oss.qualcomm.com/
Fixes: f40abb4788a2 ("ath12k: New driver for Qualcomm 11be hw family")
Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index ad739bffcf88..fe9394d561f1 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -2796,8 +2796,8 @@ int ath12k_wmi_send_scan_start_cmd(struct ath12k *ar,
 		for (i = 0; i < arg->num_hint_bssid; ++i) {
 			hint_bssid->freq_flags =
 				arg->hint_bssid[i].freq_flags;
-			ether_addr_copy(&arg->hint_bssid[i].bssid.addr[0],
-					&hint_bssid->bssid.addr[0]);
+			ether_addr_copy(&hint_bssid->bssid.addr[0],
+					&arg->hint_bssid[i].bssid.addr[0]);
 			hint_bssid++;
 		}
 	}

-- 
2.43.0


