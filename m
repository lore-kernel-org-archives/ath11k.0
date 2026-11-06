Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E71A606A326
	for <ath11k@archiver.kernel.org>; Fri,  6 Nov 2026 15:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cJ2aGQK4;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ETlvFZcx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UEE5ICXY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7RDbC0pALLr5CnExCFDRPuafJ92+0xlIvMW5RZJKZVA=; b=cJ2aGQK40ds54R
	wmIXpApz24488PbEJd69oyzKjowRkiwhEOTuEc6RoITfkCHTgY15DsssC6ckgw5CiqImtoWTylpGj
	8qtlmOemj4v4El454FiChzKlb143ZH9iLH3JqIcWDUZhdntGQlqzpcxZvUskYdAilue9KNfg06Eie
	BVQw+lcd1lZ71ksADo+TXH8wProCLkZo5OzFvsxdxajAEVj0xgq4C53CXUhxyF6sgagekp30tFNCh
	f3nv6DKKvavMzYIHzPXonB7w281j0uNpN9Nl9XQgKjaDw7W7N7dWO/S2RwCTsW+V67F/xOAt5C1YV
	AbvP1c0lYx0JUTuWqwDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPM37-0000000CrrP-1RK9;
	Fri, 06 Nov 2026 15:40:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPM34-0000000CrqP-43sA
	for ath11k@lists.infradead.org;
	Fri, 06 Nov 2026 15:40:16 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6F0L0D687884
	for <ath11k@lists.infradead.org>; Fri, 6 Nov 2026 15:40:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7RDbC0pALLr5CnExCFDRPuafJ92+0xlIvMW5RZJKZVA=; b=ETlvFZcxJaJbViQg
	s1Clz3k1BfRQ4S4/4cRR1kIAadFr0qPEgoNsYlsygLNDjsEoeM77wm/Hcp88th/r
	8wI2M8bAUQ1EorbRlwe99asSu2nCoRL97F+Taa7Tjmfu3d+9XXF07rWI61euufRO
	ViW6LkGvLeF1ZI/Pawk4gFyM7nBvaM7TCiG1/h686QO4ILjPl2pcbmcZ7u8grVAj
	iWnzzM3xA/QqNpq+JpcTHyekjVg7spprisImQQYmWUrMcgXsboenr0HkGa0CSf2B
	FZ7Puxmd+N93Mj6PD4Yp+Wh98ZdumTXu1qnyS2UTzcwAzPBsZbazi9srBNPoAbm/
	N6B0qA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pb3dmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 06 Nov 2026 15:40:13 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-370230d93efso185795eec.1
        for <ath11k@lists.infradead.org>; Fri, 06 Nov 2026 07:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793979613; x=1794584413; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7RDbC0pALLr5CnExCFDRPuafJ92+0xlIvMW5RZJKZVA=;
        b=UEE5ICXYrbXXnOp6oRcvNM5eKrZM/51FR3GMozKSlmDZq2jcEglFtYczF76mbTEC5D
         nmfn45lHogw84739KdTyQ6L2Fet0UHhHWla8sYfFqbOPnLKpuQUP8GLbjesQssrEgTIo
         k6VyM/l+FbpbxIrvVAzL0WZk6IeqyAwMP0yIGiUjAlhTHCmLLwqWMEct0y0V7gZ/5BPb
         iGWltERgvlxM5VgHxpEfdDUMV/9jxiNWI6BjaTpFvL1lanl9l7Nphd9nqbNohvMTWoIp
         QDy1GNwwafLy5Bzu1M4fVBRzKbm9jEqDc6reR2lDHFSqMyd3qHwdeg4NuUEg80yZRfp4
         GP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793979613; x=1794584413;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7RDbC0pALLr5CnExCFDRPuafJ92+0xlIvMW5RZJKZVA=;
        b=ONdrFStt0KpXbNPKcmcbLz1jG/w6yi1UipHo9I02IoJu9QPeVriX87U6tTTPv4MN5x
         ZMMu9HSeHuMczA1q38zBNKfMTon0hX0TXCkL8RF2d1ZMwmXT3BLLYO8f3NQpIIEhG2mY
         zMUKAGyJ+ZS0frxrRlP9k2l7XRLH/H3AtlAyj90djoaCZCq8hv94qW1yELkSysXnRp04
         f7EnwzpfW2E9XEk9gR/OO5OQYDCijjq7Z5PVpM3n+LL/g2csIqb0pOePhrVLgZJ19+1h
         J18P0/DF+ajmapg3GEmuLOpwjdKikzg5hiReDBwznwX+l0Mr65k4vXywEw1HZOi8iHdB
         JbLA==
X-Forwarded-Encrypted: i=1; AL+hErEpYccz6AM88PdbbW6dQINf/zML8aYQfMQHEbPaTz/RE+0Q2g6b6a4LFGQ9AmAu/uTZrCgPSEk=@lists.infradead.org
X-Gm-Message-State: APuU4Z/UFN2gpNOtVmex5hn+FdiI0tn3eCpY+KxNoJ60Daqhr1hy8Qoc
	naofVg/m1WcAU0z8h1WPGHIysFB+1N1rq5H3ZxHd8ssHg1ZekEn2JPZHu85xdWzkZQ4H2iEZymq
	8F8oXr06NcIMXSjSgCf0+euvpESs23Hx3ouDkbPOjtBnD+2Nkzy2E/hQGcdY9vPnt
X-Gm-Gg: AYBFou3hag88gwy8HVuUGFqhyRaLy/0V22A52gPXkg74nQShhfuj6iFu6HuwSc5eTk4
	uWjPCoNCTOfOi++4cwDUFZHgjA4HTSJtSon0EVCBwnoDyqPe45svwX+ZSExr/A9BGJYemB1Jq9V
	GKfomyRjLTqHT8CmC3eBRTYcG7UUEafF0cv+EHcnwhXyu2N+PI2XIL2qvFGhhqdysWtSeU9c6aO
	LRvBzJV0M5H7GIZCS4c0jBgojaA143t7ClKiA3RFmchhUQ/KtKjhSFi8MJ7q9BSk15KcTLnIzc3
	jIWO/scrUTitSuXYuYQ5B+9ChjOSXEgokqrH8b3veW5yBx1SgT13PrDSDHrr6wTqMFpZrLPfSrB
	xnHRqwa+89lzOeD0r8BgR1aVWWfDfS95iOdjms6CDorms9YRuTA+kvyz3brs3mRz/HxCduAvtzN
	D9L8AWj9gec4o9tCel8U2gMesbMbg=
X-Received: by 2002:a05:7300:8281:b0:369:f2f4:b227 with SMTP id 5a478bee46e88-36f75b1ffd2mr3243554eec.18.1793979612747;
        Fri, 06 Nov 2026 07:40:12 -0800 (PST)
X-Received: by 2002:a05:7300:8281:b0:369:f2f4:b227 with SMTP id 5a478bee46e88-36f75b1ffd2mr3243509eec.18.1793979611960;
        Fri, 06 Nov 2026 07:40:11 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa97fbb54sm9851246eec.13.2026.11.06.07.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:40:10 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
        Govindaraj Saminathan <quic_gsamin@quicinc.com>,
        Shashidhar Lakkavalli <slakkavalli@datto.com>,
        Ganesh Sesetti <gseset@codeaurora.org>,
        Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jiale Yao <yaojiale02@163.com>
In-Reply-To: <20260926114037.3231795-1-yaojiale02@163.com>
References: <20260926114037.3231795-1-yaojiale02@163.com>
Subject: Re: [PATCH] wifi: ath11k: Reject short management RX frames
Message-Id: <179397961055.1195422.13808864180410221932.b4-ty@b4>
Date: Fri, 06 Nov 2026 07:40:10 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-GUID: OlRWJoIA_T45lDwnivly_fT8lck_D83J
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2MiBTYWx0ZWRfX49CdEDgy/8VY
 S6j94Df4NqXAbsjz1aZtuJamfOhnQ0Vy6iQ8LIJYcJ4FOmu1RLaEo4dlBfbdVCVmm2nsexJOJAG
 jfYwuJbTbY7xwUl51lrWkvV1KVmQeck=
X-Authority-Analysis: v=2.4 cv=LIrz05W9 c=1 sm=1 tr=0 ts=6aedf4de cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=mSvAxenApeD-3uNJg0EA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: OlRWJoIA_T45lDwnivly_fT8lck_D83J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2MiBTYWx0ZWRfX/Es8DVjhuSla
 BKQEo5R777an59hSG5extvvSygJLGJ6YHfh3V+xCMJ10KoHYVYxHXSQdf6tyNHMVuwWkCDIm5Bg
 vmXtc4jXslpUYPVx0ui0BOechOdu/cuqd6rNMcas4VKGWEAJaQoQzWcNbJQfN8w8osjJSacLGS4
 ZwG2RzhI6wWgJ/onFmTlKWh3ZPps3PF5B44umW78TpnM5T96t0bi5Xh4hLBaAhwUIk9GINPI6IS
 kGObNt0e7UZ1DLz0XBziYAkcI12KaJv3EPzH+gQ4N+6giV5rJ4jvN/tOUYxsD8FA8Io21g/x7wL
 JJmRjpuUM876RKcSZof447PfTVqUKikx5zo25uRr1GHnTFyTXiZ9Oy5Kp9wrzaZPbVMAuZYhiVc
 k2qFAihnfFFzcU8cSKo98nFLSV6BCVt2kkQxg+KwWFA4pIDRZbJcdOIXURGN9+ZEUn33LvXJKht
 63OHaANTF3r+dWpsFLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_074015_126271_1D9AE1D6 
X-CRM114-Status: UNSURE (   8.88  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Sat, 26 Sep 2026 19:40:37 +0800, Jiale Yao wrote:
> ath11k_pull_mgmt_rx_params_tlv() verifies that the firmware-reported frame
> length fits in the WMI event, but does not ensure that it can hold an IEEE
> 802.11 management header. It then sets skb->len to that reported length.
> 
> ath11k_mgmt_rx_event() subsequently reads frame_control and other header
> fields without another length check. A firmware event with a short buf_len
> can therefore cause an out-of-bounds read.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: Reject short management RX frames
      commit: 9e15ccad0877c4a748bf2b817811a23f2d71bd92

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


