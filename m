Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0638BC4450B
	for <ath11k@archiver.kernel.org>; Tue, 14 Jul 2026 18:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ORWwFTyU8ydlZKKZaPMxmUSXVMyqCzlxGKqNDFWFPmk=; b=zaDVHCUv1kl8xVaI9UTnaoAwix
	Ky2BZbs5s7Eg0UQMvbwE0uU5QDBUugikoiS3Uz0AwWn/mEzxkR7XULHF1MSw+4Wr6C3zaHPMJxe5D
	ppBHzkl9YU65phgaL+SAacCbWJj1X7Bihz3RbTcICgpiOdi8aF+ew9pD2DHC2wm4SPSkrg5hdNQin
	Qz8efPwuu5/hb0kU1f8UKJ9nwpbU/md0I2IbWcP95pO32WLhZZZO6OCFnrF3y7gXksz0xYfJNz8bg
	qjp/vFWPtUG434zCCQ72x0Cn5NSbT0sbcsMpDgIeDX7kqT4uRG6c2f0E+ZWOTGNubrqFfuM4P7rCN
	01OS4KEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjhY5-0000000CqAI-0vXS;
	Tue, 14 Jul 2026 18:08:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjhY1-0000000Cq7v-240D
	for ath11k@lists.infradead.org;
	Tue, 14 Jul 2026 18:08:02 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EHAPc51028352
	for <ath11k@lists.infradead.org>; Tue, 14 Jul 2026 18:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ORWwFTyU8ydlZKKZaPMxmUSXVMyqCzlxGKqNDFWFPmk=; b=CWaQF3H/uZje7rtQ
	MDhoYnzT0Vnd+kcz2ij3/+Dzygg3j+UsiiHcuy3j6FfcfXLJcnd8X3ZYtwVTcb06
	pcC5nbk8tNMRNFJFtpYaJgEUrQa4/wel+yjgX36UqmaHnfGo41TqDuplKVrLEJVU
	ismxUTyXU6gt5IrRk03hNNFHTN0NsntgI63yYsligCj8f1YdI8IHSxyG/6HNluSv
	7fUs0X1Iisam8nZge0rjmsWGXhesM1lltmWaUmYmCJGTvKsujRmX4j1ryuGDiPvr
	y4PBGl2/lv3eUJNDdS0vek1kEene4w+cgcKFYzM62v1j4zfR45lyo5csf5fjCIXM
	/FStlQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9g06eu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 14 Jul 2026 18:08:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e7ee64b25so180592785a.0
        for <ath11k@lists.infradead.org>; Tue, 14 Jul 2026 11:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784052479; x=1784657279; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ORWwFTyU8ydlZKKZaPMxmUSXVMyqCzlxGKqNDFWFPmk=;
        b=QUypyybbmdqjWJI6hg0K1zKvDDf3fsnvVhtxAkRJxCmyeuYurlf6IMtLomgYMLQjwe
         it7Bg2ReyLvRy+y9mqTh2kicziO4fnF/uXyhD9nBdyn9Yhfs3izttPhPGf365/EGvKFm
         oYkNBUcZUMQtXxbXFQIxnM6stGhV262MOai8iWQ063r2NIUw/zzMRd/ou/VY1CFelRin
         EnaU/gwlR4mguX/xIvXioRzBleEKZhmxGX6DxYWSsAHKrHS8QTtri0v5m91mBSVyNFGF
         /xVpY0IbmUXh/+JdXXC38/70ha5uYv/g+Nbjn/EMdQlKTgPetGx7MfQ+kAr6nnuo4Ooo
         0wLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784052479; x=1784657279;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ORWwFTyU8ydlZKKZaPMxmUSXVMyqCzlxGKqNDFWFPmk=;
        b=qEuMhh4RxqRu1fG62qlzE6kBvZ7fVgXSrdnszAeIAjWxrrX2prd3YwV/4r+6ztvboo
         g+NfwglywqAhll7tJYCgpSUff6kVJZUoM3WlaSWgqYPdHiMk/v4H3461ZFipHuAkZrBU
         D62WJGGWFy0qhrFMR63wj7kiMS3oZ8WmaFbtHIHtqm2YP33xNhmIVlY4202FC7uiSDoX
         6Wpi727ybtVzAPZ90SgK3sOQsdHN3HYdVQYk4AMYMpKrQZOo8PHfuUzPdvAmOnEGzGaf
         CsktWJqDmm97+wylzgMb9Tqv3UUTeh557V64n0a7Tfe5EkoRowq+rFyr+h3rAcjjzHki
         o4Pw==
X-Forwarded-Encrypted: i=1; AHgh+RotOscEUHCfLcnb5sYsNQ2Vo9Fzs7Swcvx2mAaKzvRGrfDX0ZhkKli+s1gcX2K6OHBfg1ZGnEk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzAmUTpINfnUd4KiGZuH6ujadha6RMy1skmtJ5OM1YvB7d+W0lD
	Nwy7oJN7eP2AA0yQhAsyIRxTxpR1XrmucRx2CS+SgOKetfVANZt6zeooc0pFltbICmxn7s319jw
	w+DBPD7JL0w1F2Z+h7vwmwfi9t1xvnURtC4zhkBCMr87xmRo+terBQw74lq47tXre
X-Gm-Gg: AfdE7ckWyep968p3s55s/EoocmuexwCJ0GcVrr0CROvNnQFp6JThC8lTAN9iESluW3w
	r9EE3zhmmWcJdw5M18R+Vy48K+wo0YKuMjLfgqQP38NdBng5oXpxIe1YGULj5oxBoFYkmkEU1+/
	GONOg62bgCd167DeQ//t/s1DBhU4tsOi14B7tezhucOGP60JDD0lZWP3jVjk7z5fjzSMGa7cVrh
	awfAPE8c3WMaA6ioiPK7cmS4oO9zKCEeJcYo4oz6gfaiV6guF5ZLeZIiWoYZnrH0ktN6t2ygzzr
	/1oc+7F30I28UnNMZOXBjXuTudIoTLO/pn++nvjMxVJujj/M8l+P4oMtPkNLgkW6QuiAeOlpMmn
	GvOOUCjHp3DlSNTQMnpzNnfyuxSwstZX4NJ6MIfwX5lltFPzHVEu79dybBd2CwCExHg==
X-Received: by 2002:a05:620a:a806:b0:92e:fe10:3f03 with SMTP id af79cd13be357-92efe1040d0mr1018223685a.53.1784052479604;
        Tue, 14 Jul 2026 11:07:59 -0700 (PDT)
X-Received: by 2002:a05:620a:a806:b0:92e:fe10:3f03 with SMTP id af79cd13be357-92efe1040d0mr1018220585a.53.1784052479130;
        Tue, 14 Jul 2026 11:07:59 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930759c63fbsm465448885a.22.2026.07.14.11.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 11:07:58 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
In-Reply-To: <20260701-ath11k-invalid-he-mcs-v1-1-7d963080c079@oss.qualcomm.com>
References: <20260701-ath11k-invalid-he-mcs-v1-1-7d963080c079@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath11k: cap out-of-range rx MCS instead
 of leaving bogus rate
Message-Id: <178405247787.4102418.12391638022889405750.b4-ty@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 11:07:57 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE4OCBTYWx0ZWRfX3LUxYn+ktGaC
 nDBSigstWx1eYCDW2QSC7ZG1vv3VQxVWm5pfAZ7AGnkyYbTnHTdcCGBh+6hma1P/vHaYGHXk9Lg
 gJwFFqEBwFJi8g43OozhUHbysEE1JYw=
X-Proofpoint-ORIG-GUID: byqAa8HeAwuQFWYG-vMHuf7Tph7K1Tfz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE4OCBTYWx0ZWRfX2GWMJG1LHXvO
 0lwxfIyhVd8VP4mo8wyBTrzl1u2QMexQ9VHSs+A+rfqnio11MOZoc8710qcm9kBkivvT5rG6niB
 p6KDoxrEQR40zwwAq5fCHkwv3ez9Y8nG+4hha/7p6MZJVruaeXYWBFO9kmeZuP+2SY29oTb4ppz
 V3GG9aza7K+4X08Mf+b1QTAg449BHrwaX75aTqgRNkhmvg4xxi2hr7ISJAgdsC1TEu44/k5piHG
 9KY1Gz2CUFlMSp9SH2KV4cuPJ1Akr9l5MNx/4vgTjAXKn6wRtfL6QYak6UdSwvKlNA6Lhxo+vhJ
 0pNe2LUSdnvwG0hbmhsPf7pk9yKPKtkngMYHjD+dWDFa0WaXWsLcnxQrDx3aejCEXqCGDU7FB5R
 Epy6+6p8yGFjvUlJdp4gXP3cM7vmecgc49NQwTjcok9SU6v85bNRt0XhhQwF7O8gPzSRM+oTubT
 NSuCK/zF/vcC6ZW2Aeg==
X-Proofpoint-GUID: byqAa8HeAwuQFWYG-vMHuf7Tph7K1Tfz
X-Authority-Analysis: v=2.4 cv=VoATxe2n c=1 sm=1 tr=0 ts=6a567b00 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=TnFpVpZPzLH6y39Q94sA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140188
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_110801_654553_63CB41A6 
X-CRM114-Status: GOOD (  12.23  )
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


On Wed, 01 Jul 2026 09:49:13 +0800, Baochen Qiang wrote:
> ath11k can receive HT/VHT/HE frames whose reported MCS is above the
> maximum that can be expressed in the corresponding mac80211 rate space
> (e.g. an HE frame reported with MCS 12, while HE tops out at MCS 11).
> 
> The frame itself is valid and decodes correctly, but for such a frame
> ath11k_dp_rx_h_rate() leaves rx_status->rate_idx set to the out-of-range
> value and never assigns rx_status->encoding, so it stays RX_ENC_LEGACY
> from the ath11k_dp_rx_h_ppdu() initialization. Once that frame reaches
> mac80211 it trips the rate sanity check and the frame is dropped with a
> splat:
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: cap out-of-range rx MCS instead of leaving bogus rate
      commit: 12b09e478aa7459b7893a695ef77682202f2da83

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


