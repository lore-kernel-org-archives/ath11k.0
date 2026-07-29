Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255D5C53200
	for <ath11k@archiver.kernel.org>; Wed, 29 Jul 2026 15:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MZOKf9mSd0crSLc2wh8F4zMblAYXsOwHLgHJ66RKogc=; b=byhnqsmhzZEZvt
	QwhZdtr1LQdQWtyAypYvmSiHPSW9pTyhbXp+muGxrAwIjPfFqZsTQhdcEfD4D5z5jV2VdrIclmd2s
	tVX6b9b0elUGP/YEMQYxlFnPl1MD20/7/LlZbuWEtywD2WNBCXDDZOb7tehyexyhlemO3wsTluUQ1
	BjYjxaXpskscXD7e2QRUf/V54wD+c1j2ZKlQ5n+hqQNcSHT8g+iOtCDvzM8YwmRjM/6iMJn1LcbDQ
	BjZ4mhiKqFkCf/J5mpvzOp9F4/ezquPQbWU2V/MWLc3NR3jk0zPenWc8sp2MJnfLWMqdhFn1+1fzC
	xm02i9Gqp4T/W0y3VRZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6Ay-00000008Ot7-0Re2;
	Wed, 29 Jul 2026 15:26:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6Av-00000008OrR-2bhp
	for ath11k@lists.infradead.org;
	Wed, 29 Jul 2026 15:26:30 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF34NG1700261
	for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 15:26:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MZOKf9mSd0crSLc2wh8F4z
	MblAYXsOwHLgHJ66RKogc=; b=WWHVAYtI7Uwd+Fy9wUpZL1r1ds+B76Az7q4TAg
	+9SdFtxrg3CXrmgqHCJSKbx61Me8KnnvZEqNrB0QGChJrnvP0FsHiIn1du0qiS4c
	wi3X0AJk5Jwx7sCFRU/t1EYIPEJBoT4hejObiIh5wKvgfTkZ8XRacUlXkk30nb3t
	0/DM01hyOnOZNzqeoc8yaRNpzxAAQnqtEvprrbP/wekbk1wJ2P6VKjrnPISHqTNO
	CAWzwnXdnYVFX4DDyJA03NKK5jBT0Pi63owkwkQLcysOklLvmCTs3Q6V9VjTOsjy
	/UHmO0bewUemU7A3tQtlnzROL/XD7Kk2hdEe5RTMakpDwkIw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgrj1406-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 15:26:28 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb5cc1e13f8so1382944a12.3
        for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 08:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785338788; x=1785943588; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MZOKf9mSd0crSLc2wh8F4zMblAYXsOwHLgHJ66RKogc=;
        b=KB8KdLV/poZ0Z7K1wpdhq/Au080cCq8iAnPL1W1yeFjcMOGCW+2p/LSEwdDHwT/Jfb
         UG340xgZiNrkJNM+fD3KKTBhheXufpSf7STIvMUflGu/FtHq2XHrCU5MfyK7hsW/rEto
         5so5x+vLABKqha808OBd35CgzK3+0HcGiDDcIIQQGKO+XztWBuOhJPy889AGzOVVJaHg
         q8DUmahvWHdCq5JOjN9cfnYW1MDGnYMsjPLcTOfAaEjYat22Jpw9M2Gtj2qSFwrWUWiA
         79GT4GKV9BnDqJtTU6PwzTYwY1efCI/S5FEn6RcHX+h5uYTTarpUgQlYocOwPx8ukihd
         LIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785338788; x=1785943588;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MZOKf9mSd0crSLc2wh8F4zMblAYXsOwHLgHJ66RKogc=;
        b=lb4ZjH9n21ubFUznAxOOow1zRXxpO89JadhcnxzAdADxJN6+6Prx0L6eF9YfOVfigB
         jQCUn/M5tvwWJ10SklVYXXJSmBqIP7HqSEg4gsrr8o3HZ4BC6+Oq5mMZpxsDtNMP38Gh
         YwCXwr0HJtWl7nQ5rCHGYPvrwoCUOPHyq9ygZ8Z7sUrfPGwlLi+WDa2blmZqZiDj4p3y
         hUuvoCB2LO721iz+y/kfmVH/38xWGMOwdPBb7/kwQj8ffn7kUgf85Q4HK1V3AR7PB6y3
         OgAH7VCGzJBlQjiu1Hyl2ZWHyriCKXrnXihRTT5cnZLb43B3KYHs5Hu9x1cAHFEurCUc
         vWBQ==
X-Gm-Message-State: AOJu0YwOOlo68zZnKcngCDMA/WGt7ZxpMVBHuAy/go6yFMWQWlByTa4m
	CysxA8aO/JlfSQsJ/xuvqEAIZ2X/Mmbzms9HAHRxv0PwbU2UqD9/jB/NsEDqUPXlmWtYLEJdtH1
	ecutg+0Kprbg9QH9InUMEaqveMOFzcxArlRFz4phC/yLyR44wi1cMDK54NJ3BsuuY
X-Gm-Gg: AR+sD11uaQzbE5Ff7eLe+gMPPCFdxIL762BzeJtv7aUrMbi0rxvoPx6FCujFURQEdoj
	ojO2y+OAI7G3tObulE9Q4lHRpSr6OYXdqs9IUnZF/LjQcGvQ9Ju+BhDA1/IpYejufEjfSKKikSp
	JlIw31fQNbFpOGeGuAU0ac6zhdqRPJkWbDXyFE1xpJ/iaM4gO42EDWWTkrBMqQeEkcJ/s/qu9O7
	DhCJTDycKYd9bD9+5Mos7kuGXwRkZj433GfJOFr9uLl2fopbkgXS/F2l9NQ5jfpeHvDg5FF6u3b
	dSqDDs42gp669v1oCxx2eQyp+3Onyg974Vb3yP/1NwS/9QLxbwVzyn9AAc1Hs+iCX/UkK4pjA51
	c+b0lzv7U70Bm/+qqAs7ciI+bUAKCOtMbV1hcgd+EQAeR7M+Mrved2X0=
X-Received: by 2002:a05:6a20:cf86:b0:3c3:875d:704d with SMTP id adf61e73a8af0-3c8ba458430mr8314529637.25.1785338788344;
        Wed, 29 Jul 2026 08:26:28 -0700 (PDT)
X-Received: by 2002:a05:6a20:cf86:b0:3c3:875d:704d with SMTP id adf61e73a8af0-3c8ba458430mr8314481637.25.1785338787817;
        Wed, 29 Jul 2026 08:26:27 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504d480c5sm18005300eec.25.2026.07.29.08.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:26:26 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: [PATCH ath-next 0/2] wifi: ath: fix stride mismatch in
 mac_phy_caps_parse
Date: Wed, 29 Jul 2026 08:26:24 -0700
Message-Id: <20260729-mac_phy_caps_parse-stride-mismatch-v1-0-077a1a0c50d8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKAbamoC/5WNyw6CMBREf4V0bUmp4eXK/zCEXNuLbWIBeyuBE
 P7dSty50c0kk8mcszJCb5HYKVmZx8mSHfpYskPClIH+htzq2JkUshClFNyBakeztApGakfwhJy
 Ctxq5s+QgKMOxlLXMK9HFA4ug0WNn511yYRAM73EOrImLsRQGv+z2Kdv3f0RTxgUvtQA4dljku
 j4PROnjCXc1OJfGeOs/xOpnoiyhVllkXrX4Jjbbtr0AXI/Q4TcBAAA=
X-Change-ID: 20260720-mac_phy_caps_parse-stride-mismatch-e7292580f072
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=RJOD2Yi+ c=1 sm=1 tr=0 ts=6a6a1ba5 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=rUlN9L5Rg0sLS0zbAgQA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: -r_a3Zm9BswhgnhGGkDFtH90H68rJDdx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNCBTYWx0ZWRfXxqZKC/tctyKq
 6BXhvlY6CSBh82Z0DCRly9/xcCNHlSmqDG44zqaz0ZlcGlK+KkjpdkgesZGd/xlhCdNfi2yrJrg
 jMNn3FEbBWyOEVVaTJYfFb9OZlrT9ADzodCZxAwnkqWSXDF5dWcrM1OeHGUIbmDByQ1Q86STl/a
 fvUfMvLu1w88BTn5vUW8A7GUYbB5FyxXWN4F/KNfuzFMOXQOHH7U2eoGthrH0Tne1jl1dGTGPTh
 iUxo5HuZbpvMoDEMvD8xksRJW1Z1GwLwSiMDeT2mh8XWTsiGXmJCjREC/CwemZ5h1jZ3DrOcWVS
 p2rbCWueigyAbvYQ1ZVxyEErc+x9WbzjPYq+4yESquZ52zpo1x0Ibjhffn9CLdqcHe4PLmC0YmA
 WnR6AjHwqXxUvgQPh6Ni5qRYz0DIrhQVd21mNFI0hcrAnXOqlQCFo9fH466Po573Go/VCPUFcPP
 lJtk2UdebBhVNSe0aAw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNCBTYWx0ZWRfX7IHeRu8Vm/GK
 /1hfSkVV4mVVxNhvbhsj6gJbYGoQQpvWym0zzR6ryQdPrC80Nu2ewm1G/6NM6VfLGolmGcIiIbE
 u79VkRCPUvKRJqznb06bcxNTdPe9cwI=
X-Proofpoint-GUID: -r_a3Zm9BswhgnhGGkDFtH90H68rJDdx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_082629_659288_4CAE4A16 
X-CRM114-Status: UNSURE (   8.46  )
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

Both ath11k and ath12k have the same issue.

---
Jeff Johnson (2):
      wifi: ath12k: fix stride mismatch in mac_phy_caps_parse()
      wifi: ath11k: fix stride mismatch in mac_phy_caps_parse()

 drivers/net/wireless/ath/ath11k/wmi.c | 8 +++++---
 drivers/net/wireless/ath/ath12k/wmi.c | 8 +++++---
 2 files changed, 10 insertions(+), 6 deletions(-)
---
base-commit: 189721a4afa1804315e7dcfca9ca0539c7b1d7af
change-id: 20260720-mac_phy_caps_parse-stride-mismatch-e7292580f072


