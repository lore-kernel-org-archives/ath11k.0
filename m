Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F322C3ABC9
	for <ath11k@archiver.kernel.org>; Fri, 16 May 2025 18:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ep3GVkZ4Eolm/Nd+NWY05dh9tPS7F/FgWegfzyDT6Xw=; b=jGg05SMEjo8iM1zwfXlb4oiqgZ
	MOM/0SNW0r1FGn5ID9qokQJCJbdFNmdOWwJkZEnXO+wTu9h7aaxdZ2DEHIsN6JEQNEoqZkdIuLTug
	JLyNGRwyLJV2eX0wH40LepM+C7HZJa02WUnXYBpCNO99J4AJvieHa1GmLGbagrZecKwV919Kcdj1f
	woxS+zWUzAHNzgJvpvfoUSmk3J2spWYsr9W/Knwb27UMfSfhD+iVVFGK/gREy5ddfI6nvSYhUc2Ud
	H3sCRFApe/WcTtsrRVhiHLBNDI29nkle1nYHNTOmg33zidvOcJtEUJGahBhVmlvtgToM3Vyneg54u
	CR/wDtEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG01u-00000004MLt-3d77;
	Fri, 16 May 2025 18:43:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFzsk-00000004Kvl-3l23
	for ath11k@lists.infradead.org;
	Fri, 16 May 2025 18:34:08 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GBRuEv023203
	for <ath11k@lists.infradead.org>; Fri, 16 May 2025 18:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ep3GVkZ4Eolm/Nd+NWY05dh9tPS7F/FgWegfzyDT6Xw=; b=YjhXfSGwOXSVU8SN
	QXzWuY8kKT06vZJHHqm9AessV+QGtpkVYTHMTHOZqyVHFQ91lBsg6l0xsJKnowk7
	sU/flYvBOMt5mfN1o/6gS35ebrr85vOU2gnnLHo9wSEZvv4+ya+Xq/cUKgHDwM7J
	3FiO3bnHrGciCqjckbO8rR+11lfxYsA9nvlmdG+Y6ShUsPD42YZBSGScArll7P/4
	sqt5GpdOrzoifNV7eG3iLRuSjg4fqf0JCYix5XVO/45GEbeZwhtpJ+ye0xi6g7G6
	YkCj/aegEW6V/+dhH6TrRW2Jo5kgIqkcsNcY4MVQhV/Fu0w29tA4cgZFCXysdCz3
	YBaUZw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46p4gq953s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 16 May 2025 18:34:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-30c8c9070d2so3855759a91.0
        for <ath11k@lists.infradead.org>; Fri, 16 May 2025 11:34:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747420446; x=1748025246;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ep3GVkZ4Eolm/Nd+NWY05dh9tPS7F/FgWegfzyDT6Xw=;
        b=uEKjq761ii6xpw/zmF2pTaj6iI3577lkCymlU23lw7sCgGBBUM32OUcFFE3kEZXPMF
         Jq0O+AaR0TixxXQCy/9khhShPS/8YfNUgEs0Qiod+ChD4WEmjb6i9aPDJIpEkU+PTYtx
         OMoz4KZKtqa4D2mEYi+0HTy1BqCr+zyF6hh/aPMASgCPgA4trTL34wgzxWTuDl5O7+mr
         2VHSQGxFZKs6REmkWir3hkllfkffbLbU7tqSZkT/nAJQSsHW4gTQVbtkgsev2/AC+IyB
         Ftd3PKE9xMrG74VsXcWLul39LHC5di1WwjcQFzQJ9DcIQeeJWnmuS03WlkfokcOkrfg1
         R4zw==
X-Gm-Message-State: AOJu0YxdUFt1wBNCeq2ODc1QGiyUjLKY0ZRH+HXoWEYepg0BgKaDVkDh
	7TBxo7iByVSCHbisi/YBpMW05oNZ+Mw6YE5kJYckVAo/cIpRtXlUeJJ0ZTUN+jkg8pc9sau3+It
	WHk5B62eCBoaJjbx5HbaTUXbEV23JDcsN0K0Od5SDGMpkrSekTviRajqi3AbvGeZZ
X-Gm-Gg: ASbGncuyXd4AcLVb7DsFGPmf2Md5p/Cre8B7htjxk5Bd1qZrCuhT5NgfMMZHwKybKZU
	ylS9VIhU5+xXMkwBkmR37BaiX0wo3NFBTgvkY4KPH+tN5bdLv/Ng44WefXKJg8mpSiypWSgDEIT
	O14ZxiLzHj602tWGMY4JNFm2DCDB6JvFQVxzxMI4cCKOJkVKtY31ljtinN8gDBG9ielB4aD7X0v
	uG7ehwwT5RRQzmCfB8K5lMGsd3ivQTyEu1gMlFam9qzx7Nqn5lScHJfQCsO9I7AVgpFAuGcQjK4
	xSTW9IDCmARsZoN15O3PKwAYXgQ5RiMb0fIMQy/X4fHc/DZB
X-Received: by 2002:a17:90b:4cca:b0:30e:8c5d:8ed with SMTP id 98e67ed59e1d1-30e8c5d09a8mr3472355a91.19.1747420445675;
        Fri, 16 May 2025 11:34:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmwxsYFanrjNojESxjOjstpNSKMOyUoQ43sxObOWZovIg1oLpCDHjqkqvVd1CCMDR5DP9LfA==
X-Received: by 2002:a17:90b:4cca:b0:30e:8c5d:8ed with SMTP id 98e67ed59e1d1-30e8c5d09a8mr3472317a91.19.1747420445236;
        Fri, 16 May 2025 11:34:05 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e7d576babsm1886299a91.33.2025.05.16.11.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 11:34:04 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: kvalo@kernel.org, "Yu Zhang(Yuriy)" <quic_yuzha@quicinc.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        Mihai Moldovan <ionic@ionic.de>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20241127022742.4016870-1-quic_yuzha@quicinc.com>
References: <20241127022742.4016870-1-quic_yuzha@quicinc.com>
Subject: Re: [PATCH v3] wifi: ath11k: support DBS and DFS compatibility
Message-Id: <174742044400.3092151.5988875334107442165.b4-ty@oss.qualcomm.com>
Date: Fri, 16 May 2025 11:34:04 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: Hlv92JZtt4nLpOfqYcMJw6DT0p3vAWXw
X-Authority-Analysis: v=2.4 cv=KulN2XWN c=1 sm=1 tr=0 ts=6827851e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=bC-a23v3AAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=Fa9wrM33oQaVqebvgmIA:9 a=QEXdDO2ut3YA:10 a=-FEs8UIgK8oA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE4MiBTYWx0ZWRfX6rJXSnoJWBnP
 //U+yOIK7srMWNwUoOhxRpmewHg14NFOCjSb4zIWcLHvLBBTFw951rTDW6BKowxiz3Mqem5KbXn
 gVHKAs2u9uLAZiENUk+Xd90iLsJ1vzsOyPGEcA8hNO4ZlD39Awj0C8WD+mfMSLTsJo1OBbkPGGa
 Vhsva9ETU1s9LoH210FbP4htlcQ3rXUrCCJFq9l7GGanN+4SbzZNLa744WRrtlGP2iVFG4I+/wi
 F/43Cy2Cb62TSLa8gGeOlye2438qOfVOBv+mwijptbrA98zZIyYR2Ni6o8jxAtjazYx14M7XiMd
 rNJbIojydHNJj84kER2fM+vjqwaNMf7KJab79F5FVlpdZ/+dfXuMjoxwR5EVdrFDfAAIUdEg0W3
 VHSSJnzkN6YziBbKYa9fm13LLVfRSeG1NBBJeLswsrbwMDy75vFxlsjfHNVS+dIlG41FH0OA
X-Proofpoint-GUID: Hlv92JZtt4nLpOfqYcMJw6DT0p3vAWXw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=683 clxscore=1015 bulkscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_113406_964600_44C4823A 
X-CRM114-Status: UNSURE (   8.21  )
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


On Wed, 27 Nov 2024 10:27:42 +0800, Yu Zhang(Yuriy) wrote:
> Now some chips which support 'support_dual_stations' will enable DBS,
> but will disable DFS. Restructure the ath11k_mac_setup_iface_combinations
> function to support DBS and DFS compatibility.
> 
> About 'support_dual_station' feature can refer:
> https://msgid.link/20230714023801.2621802-2-quic_cjhuang@quicinc.com
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: support DBS and DFS compatibility
      commit: 6fe9b60f3504c7047451c5b8df14308dad440ff1

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


