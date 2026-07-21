Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E334C4452B
	for <ath11k@archiver.kernel.org>; Tue, 21 Jul 2026 20:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/l/yMHdfHJYVnxHTo5lq7Cthb1xoSc4Xg7Hp7LSLv0=; b=AbpUA8t5UJxvsKtsa0X+Wdj/EG
	rTF8VnCG3bAGeujg/gw0eWnZQ/KxRWEPFLKWbO00BZp6hN/kKB6Ov4oqcTYu8kBcf8YAhDP4TKD5K
	twX+66auoHOOWMl/GQNvzTGFMFR1fKCOp4iNdAllxFfOZOZzXqx6nLAEvGMEkJw8teVQ67HjwqohV
	EDueQaRWCvMtBOlTNkQEc2Cnt7VsWcM01sAiaqDgwA9Ag5G8rOActybqhLlTyk5YKwGHnpRmSZIp9
	nH3r+Rt6XXq3iP+bW+Qg0/OD7EbVLq8E8oJlY/Nv63Z4U3XyWTvDowf3esLWdiSRKZUOe8U91+YXU
	FM3fDKmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmGff-0000000AKsq-0Evk;
	Tue, 21 Jul 2026 20:02:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmGfc-0000000AKrG-3xfx
	for ath11k@lists.infradead.org;
	Tue, 21 Jul 2026 20:02:30 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LHRMkn2446026
	for <ath11k@lists.infradead.org>; Tue, 21 Jul 2026 20:02:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S/l/yMHdfHJYVnxHTo5lq7Cthb1xoSc4Xg7Hp7LSLv0=; b=VropzCQIOzC3O9Yv
	Xoe634TjSbnxpNlJ5kr4utpx9tMRCawCXJGibgnhFdCwslp+3FNtai9Z/6qDlSyd
	qp6gBzOMqPOLqz0HjZyzK0roGOSrxNp9upQPYMhOTMNNS/WWYv6DSkhITXhIbsJR
	MRMFWUNMVxkH3uSVKjFSCecUXIGHpRjtRr/Egx81GFT1IEQUNVrscAeQ0ChXkv4m
	+YSx4+klw1ILPN7RqbmWFfFWpvLb7P7oeDAhdlnrHXpZs09ZJN+DW7MnGKA8XMoM
	QR+BtDt1sLar7sSeDOr8Qm+bJgDx7Qw1PW4ycZAkPK/1uvukcgwB8P772wJQ9rTW
	cUoXRg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6d0pvn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 21 Jul 2026 20:02:27 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cab041eced3so14373604a12.1
        for <ath11k@lists.infradead.org>; Tue, 21 Jul 2026 13:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784664147; x=1785268947; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S/l/yMHdfHJYVnxHTo5lq7Cthb1xoSc4Xg7Hp7LSLv0=;
        b=PXxx1n2idpmqicgVQAcJQWR/Zhu7gKgmVjrjTmoF9VX+8WELwP7zKmVFis83A3xDM0
         +lrPa3X90ryMnr7+Y0nIBZ6kF/Zw27c7G2xV4PILXga4cq/PvuH5u69Gk+tkSR9k7AM8
         mEfG8KYJrCTpAfWEXWXgJz/FbYQG22pGWDBDnrAaSV+RSqa5N1emtISZ5hEg9AWI8zB5
         Jc/sLTax0JoXWiOg2OxlvS+BfRPkTzwx8OBjJLch8bF+TdO43RV7+N93X/XYgADewR/u
         u527uBiHylIYY71RW0HiH4WjI1aIRRFGMj2YbsGin5JT2hjjUkL+nlocrWTLH/9PEi/2
         ASXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784664147; x=1785268947;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S/l/yMHdfHJYVnxHTo5lq7Cthb1xoSc4Xg7Hp7LSLv0=;
        b=Sb/Es7WwpMUWxVSmII1O1YKKzzw6Gd845jwkw8057eji/k2M7Qd3BaD8zFkOdwHUPN
         94oUc81wr4nmLlOoBiY3l2mJ6771YVo9Ns3crm8+F7Z3zkFyMq0SU0M/gPlVhuin2wWQ
         VM6vdcYPuaR4X3ubN3iJIoQtMjym3w+PFRfFx00pxJeCP3f8GOm/Zi4dz3MGnwAjkMmi
         rsOWBYuitXjcy3s2VY45egBRsm9uzdzjBhJevFvk0UN9aZ45nOOBzAA59mpcb5YFAySw
         wTpLU3limo1lPrpnU1VWO5Xgi2YVShnp5aPUKDBU6RzUzoWLEsKo4UXFXNBrNR90ZF9l
         rYbw==
X-Gm-Message-State: AOJu0YxUqZEfVegA6ZoSavR/Vs8ZXDwWG7Ez2x2ifKRaxiqB7FeFsmx8
	COoMVtKvCgPUVuuaisQ1b6FNYdcAV1ELrjauB+b0cwy/97AE4SVDYkwvP0gVIFLC/cx09zau7Pm
	JuMajDS0cyUjMLPhMwu8QHaXYM1ohVYdLTCNbmHwtIgv+0me5HnUC6MgVEdVdlKrH6IAgjVbV
X-Gm-Gg: AfdE7cmK2oGehh3VYcrnAceEldPmZICiubNHwhWeCW3Iq0UrYlSdn3hZV6/wR4FScgV
	KgXbCJCiGMzHY194DLcqKmEDlQgYZ9/eo8sypryY2WczZs9DX5GGxy1F15GiKa3ak28UUzrmZwm
	MNqu0AfbEoyqeJKosu/jf8x00dqd6gssBMTnLzXByWMQS2AsJzhdV2pKzSZTgsF853FbWI1bTIq
	1GzCeQK54hNqBDewaC6PRycdQaH9ELr/W3vRSqtFE1qRGimwhpVc1dpyx20fqBqaSy1wtQ3WQg5
	7rVRzvgEiTkEhI1UT0f/SE+W6y80nKiBG9WfTgQUMSu4zl2JrHqIgbLbfJsnRsx+7axZL8DHXUB
	l7td+Jm9zX+8yWY36u9dxgpj7J1785nh/7PJ/HHP34hmbFfgnZ99F3Tc=
X-Received: by 2002:a05:6a21:103:b0:3bf:5b7a:fc8b with SMTP id adf61e73a8af0-3c3ad2e1915mr20894030637.0.1784664147116;
        Tue, 21 Jul 2026 13:02:27 -0700 (PDT)
X-Received: by 2002:a05:6a21:103:b0:3bf:5b7a:fc8b with SMTP id adf61e73a8af0-3c3ad2e1915mr20893974637.0.1784664146552;
        Tue, 21 Jul 2026 13:02:26 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1b99esm1574958eec.3.2026.07.21.13.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 13:02:25 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260713020359.3618193-1-miaoqing.pan@oss.qualcomm.com>
References: <20260713020359.3618193-1-miaoqing.pan@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath11k: add purwa-iot-evk and
 qcs6490-rb3gen2 to usecase firmware table
Message-Id: <178466414537.1747165.2309463198619583565.b4-ty@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 13:02:25 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: _MomBbil7wprGfGbC4AVyOcnAfjc9mKV
X-Proofpoint-ORIG-GUID: _MomBbil7wprGfGbC4AVyOcnAfjc9mKV
X-Authority-Analysis: v=2.4 cv=XaG5Co55 c=1 sm=1 tr=0 ts=6a5fd053 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=oIn-VHLTOPPjS-blQnoA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIwOCBTYWx0ZWRfX1r1DABTcyxrz
 Jx776fr1afeyf2BtMGLPRBB++bEPOKcyExqG20YyaBNNngS2i79Q0d6A63rY2d6kGGA9p4i6EMu
 C3W88vV3PKwjY5avFs8+G42yk4AF2idGzJvfHmEiGrFDbojYfmSBoXfBNTpEX8wmTHUw8evePPJ
 gpXIYcWohJu6oZ3NyYuquP560D+TWG2J0B2BYdu7EhduI5d6yW4N/FkvA9DyXB39zAaEikvaPYw
 72tgZrzqEi65ZmQAYEK/8h/cUo+FXW1Q0zI9UIWVQehjVcdxZUBXoVR2EbrKYk524NqN5aYnyu6
 Rc9SlubBS5vEQuv/G0oPR8reywfnHCrbujcQkbt0ynfZb8mQGPFDEqRETLDScZHn+M9BOiaS07h
 dEhR1C6v92J9prJqN6mAzk/VTQaOoufnZWBY2t6iWVR05qX6c/FPJlhvmbqjdsyAlD5k7k/cACI
 TU8/zhRavKAwWNMT9HA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIwOCBTYWx0ZWRfX2p7J6ZYNGI2Y
 SFR3r4ZArlb7qqSn8z+IoJxwWhHdsuglHC9399Y8MN5MtKuPFpUZaZL/z/vdZQkr5b7fMf8wVUx
 aBPzmlpax4YK4eNzocQdTfx63xg88/Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_130229_105004_6AABC54C 
X-CRM114-Status: UNSURE (   9.10  )
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


On Mon, 13 Jul 2026 10:03:59 +0800, Miaoqing Pan wrote:
> Add purwa-iot-evk and qcs6490-rb3gen2 platform support to the
> usecase firmware lookup table for WCN6855 hw2.1.
> 
> These platforms use the nfa765 firmware path for usecase-based
> firmware selection.
> 
> Also reorder the table entries by compatible string.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: add purwa-iot-evk and qcs6490-rb3gen2 to usecase firmware table
      commit: ca27e3c2284a7a43ba390ed5ce0d68b3c869c0ce

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


