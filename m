Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D026606A31D
	for <ath11k@archiver.kernel.org>; Thu, 22 Oct 2026 19:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=McoT9R/w;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BIoNqwJo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dVzmHwaT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WP1RCtA53459OEDtUvLHcE9mHWBQjuh3IU+rXf+WXSk=; b=McoT9R/w9r3vKG0uewpGa5pAOb
	z1fKjdBpR4o58IOkyZV/zQZfqBTPoYfoPU5fLMSONF1GZRbQEOMhsrtgdI0F48PKjInDbcCZtyfn1
	1PBKvhDro+HVpBFyNz3gpMDjkJ26MJcN9ZJh+BDogBGSsd+kkJFCnXTCEgiUuSKb+kVOzKZHzTGnz
	nxHwfzH5xd51pRV01YN2x9T5q0hqbLbwfG3yAlJQhwjDnbzz0dwgOJrdaCDcCBnyprP90Fq0UmxW9
	eNCwC4cj8zg97hmbB0k1dvv0QQeRwbyXhwkjNTZggKK+wVHbH2WP4vPnR60DUME+0Wa02q8eaSnCt
	5USVW/OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJy7v-0000000Empp-3Vsx;
	Thu, 22 Oct 2026 19:06:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJy7s-0000000Emoc-2eU0
	for ath11k@lists.infradead.org;
	Thu, 22 Oct 2026 19:06:58 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MIH1Qf1509604
	for <ath11k@lists.infradead.org>; Thu, 22 Oct 2026 19:06:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WP1RCtA53459OEDtUvLHcE9m
	HWBQjuh3IU+rXf+WXSk=; b=BIoNqwJo+9cHw/AmG/yoh2Nuki7TD+lTLAXEY8DU
	yqVhor774k3lFGuWtN2mJZkBFd1iDm09qQlX3EFldoIGWgUvY7vBvCXtLil2PWn5
	Wjk5LYrhD+59pwSlKUNqRz5FF1UPTbLZuYJVEL7RrZjPEisHOZW8TY2ems8ZxAVc
	Z9YkyY7YQxybQG1DUqAViNSM9Nb8dUMid2Z5p3LSKZmMZ+/cqqLkXEdcKvYl+kcf
	egrlF4OqlYtMf0XUl2CkZ6aSmMG8Tz5/iKLjn5ZXm2/7mxwn0cznuuWJDkeQy1sT
	Pj55wKPqvU432hIrIXn9ZZj+onlLGXmXzUT+mQd/PM2EYw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmp86et-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 22 Oct 2026 19:06:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f322ef7d3so27328585a.0
        for <ath11k@lists.infradead.org>; Thu, 22 Oct 2026 12:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792696015; x=1793300815; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WP1RCtA53459OEDtUvLHcE9mHWBQjuh3IU+rXf+WXSk=;
        b=dVzmHwaT3mMV+ufp/Zn1syTvOYfM7O4tlGiYbbyegl/EusyX16PRek7rQQWH5qO9oq
         vKMzOKNCXMqRUv536tMri/67MUw+QWdK0iYRFVpgKxBvJpMyrXR3xKO/1wSgW0qR1/hp
         uTCLCvXD2SB6/wf83tPTjDKsL0W+79LN/nl72vuByAVBh+dv1+H70ghxKUs5Lpl8vxnF
         9KC2dUijpFCkFlPiNyAMKTrBm8s1G9Uh2gSi/TZeli19Bv7D8VVqUPTByjEOmWckP1aT
         tS6vptXQFFvQHdv7fyIGR9c+BzkmsOFZTzzXuibGyrOXO1I5jr8PBHtmwejBr/hT0oFV
         GPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792696015; x=1793300815;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WP1RCtA53459OEDtUvLHcE9mHWBQjuh3IU+rXf+WXSk=;
        b=x646X6qFFbUi66ClJaTElOMI9QN9ng0eY63lhEJxDOOhgXywG2txye1AqP6SvfncKE
         Z/IV0G1wC0QzeFZ6guX+PMECmH/YfqE8pgob4epo1UIOBioCYbu/fkj1fd1Y3Nbkai8C
         +vdEFoU/AI4rAFJ/ahfp/WjUHq5ZNx/HE/4XpIDCliq4AProMjSQyNLdy6fySRZXBjID
         JycXX0vOTDYNTGV5aTBDpnl9B1EYFW5wgoRz/dL9fiVbfYVzD3TDBuIT3+/3n+pUbhRH
         nVkKaMKghKuJoTwnU9D0Niker1u0izDWu7wAP5SHO6/RaocbbS2VMiW2QKm6p0zDfhuX
         R2fA==
X-Forwarded-Encrypted: i=1; AKwUvBx09zJrzsYSsYG0tW5emMIxpQXMjd8GedEOePswqJNUe/c9uLuyJDK7QTgZ3XZGufsF1M0dOtg=@lists.infradead.org
X-Gm-Message-State: AFq9FYLbl0p6U+y3Gxan7Y0PkCYGeb7nw9af5CLT9h8O6/tLrI/gPhv8
	2nxGDeCPqCTtgFiSvDM2QwUuBjM8N0MLOW9vxn7nRg1FX+qK8mJASENL19O5RE/Pyvor4EmF+cn
	1Eo1JMIauD9GCMQGqiP0lQcK3gVenTQ0l0WC3WTJVERYAAARGWelXAQciYfaYnmROOBO3oSHQ
X-Gm-Gg: AYBFou27CCPuruQE1yzIcW6sbWbhpV/mL2ZvoGKGmkXRnJL9KMLOon085JdRJd83tT4
	kDmWexaiYyCDt5/PTt7C/aulYvRflRK1o71Kp+byD567q1N279RT/nIX0a2PWI5QJm1vVBekHlC
	E22KouJJdBLWuztnZy3Z6MNYnywEi6Ug836KcFxZobfwa+CSriFiPbmkSSoKRw22xgHoWDOnA0M
	1V2FqwAyXbyufIvqJJEou4IzW8p/wRbwx4Ix9oDdzlAIHt8FDFY+7V4pqFVWcHaIgP+Pu/f5GtR
	HX7yQSv/lUM8RcJ1Dn7oAND2pmL6lhRehjh/TOdzktH7FAJpHsLkwt9bzDl7A3XpvRFF93m/3XB
	S23wn+sA3EcqH4q2w8srx7V4RVkUJ5+0W/SU6PoAq+vKLgaID2SCtNgARNibDK13VvJrdDS+DW8
	Y2NB/BhbngvfeN
X-Received: by 2002:a05:620a:8389:b0:93c:c73b:39ed with SMTP id af79cd13be357-93f6f7c4facmr64323585a.39.1792696014934;
        Thu, 22 Oct 2026 12:06:54 -0700 (PDT)
X-Received: by 2002:a05:620a:8389:b0:93c:c73b:39ed with SMTP id af79cd13be357-93f6f7c4facmr64317785a.39.1792696014437;
        Thu, 22 Oct 2026 12:06:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb02a31acsm14215e87.81.2026.10.22.12.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:06:53 -0700 (PDT)
Date: Thu, 22 Oct 2026 22:06:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20261022
Message-ID: <vicvgdgj3hc72mj7q2bp6mdskwajufdexr3gz63v2ixrmua36b@ojvj3wo2j4q4>
References: <b1845835-415b-4c20-91c0-fdb23de1e1cb@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1845835-415b-4c20-91c0-fdb23de1e1cb@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA3NiBTYWx0ZWRfX0YQxcbxYGSC5
 l0DIjuAtbW67GULiOR4BZEp9CfQtvMJidzdDQbfCyx1BrtTSOKwfuAbhqpohAMm+/YxuN3wPBQO
 wizJkp2YtMvpcCm2sliy2/tCvwsCHNQ=
X-Proofpoint-GUID: njA-0qZ0ehOM-3UJ8WyWj20Dv76IkTAq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA3NiBTYWx0ZWRfX0DJCjoYZVjix
 AX16HDv0WfFS8CPWEjqY+mVuda7GyNlL0gO/N5F9fVOb/M7qfK9BSYRP3bGUptRXS6apiM+CtoI
 i3VSz79y9gVRr2t2P3ltjJJ9J25otG0/vCp8qxn+X/13OqgWVnziLzSCsXqR9xUW4Io9zZJrahR
 SnYNtt2gEVcaEAEdee56bcnTH1RTgQf8cGOmA7lIyOyty6Nb9C4owfijnhBEDAjxf1bRyr7CURN
 KqrurH/Q4DUSqpoxHtu6DQPBbN4ls6FOn4l6nzojTxppnzWIjIRV3+xdvUUKdtQusQUlhzvgU51
 B7xqg+F7s4KNA/9XJNDMu2TYkoJm0DAxhM6NoEgjcM+r4boWX40pCDnnfAw0HNObPzNiVOjlznW
 Ew0stC7zfgmI1vtfVAaKDElMiHDqMQeqqRXnJYthrsREA5+GxTCNLfiSu44kiTWdoyJQ886ADxB
 oBvTT6Qx2OUDI828Uww==
X-Proofpoint-ORIG-GUID: njA-0qZ0ehOM-3UJ8WyWj20Dv76IkTAq
X-Authority-Analysis: v=2.4 cv=BdBNQbt2 c=1 sm=1 tr=0 ts=6ada5ed0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=p0WdMEafAAAA:8
 a=u3i0YCyx4Cyti68HAGEA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_120656_755400_8EF02EC4 
X-CRM114-Status: GOOD (  13.59  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 10:50:15AM -0700, Jeff Johnson wrote:
> Hi,
> Here's an updated pull request for ath10k, ath11k and ath12k firmware.
> This supersedes the request for ath-20261021.
> 
> There are no changes for ath11k or ath12k.
> 
> For ath10k update WCN3990 shikra/wlanmdsp.mbn to WLAN.HL.3.3.7.c5-00226.
> 
> Please let me know if there are any problems.

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1319


-- 
With best wishes
Dmitry

