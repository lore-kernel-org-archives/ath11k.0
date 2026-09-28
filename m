Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6EBCA5FA1
	for <ath11k@archiver.kernel.org>; Mon, 28 Sep 2026 16:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o+2kKaVgsH8aYlHLbn2zMClqTNhp5rcXnKcP0njRaow=; b=XW+TVrdiV1XqNy/3lSHIzjXDJb
	IDKEwQ+uWPU5x/N6KJT44j3pVEAlEphCmjVh/OpADKoyp1v900LA0SPCR3M10cseH/09w9YarGLYC
	HRfD80WGWw/XGExbjYNy1OB0W3TEz+obSTDneDF0/0Vs3xmfrG/biuQyRWqYi0E2yf9bZmRLyMt3/
	rSRdNS158Oxv4RQNFpPcB8ZHaYmDe3fYmbnc505yczzaLclveyksC34ftEaSN4fKcDrReijIWyi4p
	8YcmHeW9is8/tO6m/8CSOc7dCNj+ojlCp+B96h85hAqUCuMRWPrVBmiOAG2pcsMARlrHtf6o8YNs1
	Mze/ezKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEgR-00000001663-2Iqy;
	Mon, 28 Sep 2026 16:58:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEgO-0000000165R-2snL
	for ath11k@lists.infradead.org;
	Mon, 28 Sep 2026 16:58:30 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEe1nF1498400
	for <ath11k@lists.infradead.org>; Mon, 28 Sep 2026 16:58:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o+2kKaVgsH8aYlHLbn2zMClqTNhp5rcXnKcP0njRaow=; b=l6diSA2bWvfGwhno
	75t2RmDPlnMXhwVbAzP6E1hpMB1UQkuKg4YFzDjIWVc4NoWrGfcSfkVP9UrGfVWy
	S28+tvMGML2+3NqibgUpK0zuvMDnQrK/o/cSU8mtiohVc02JlmMDdnx3O4MkVw7S
	P+v43Sm3WNEuVDH3rNODIXL75P0yY5P0q0EF7eFnmZiXMMXhoWJL72MX2yJdT/9d
	yYZLdtji1tqMCnPVhH41CSbgoqQi9yeXE5oBDDxVYtbBxwIyVn7XVGPWUfFDwf0N
	DU4erIGNO2v1P/E+gk5SHr+2V70OboVsnocSNdqx8UIoB9mMXrBgZZfDJN4hGVE6
	cjElcw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyk5mtcum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 28 Sep 2026 16:58:27 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-349ffa249bdso1562759eec.0
        for <ath11k@lists.infradead.org>; Mon, 28 Sep 2026 09:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790614707; x=1791219507; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o+2kKaVgsH8aYlHLbn2zMClqTNhp5rcXnKcP0njRaow=;
        b=UWkXiwa1D36EZ3MZCb/fMmp3fvosNRXKjPZwPQA6saV5dvhsVFO5P5Bmeg70mR5I+9
         A491LGeYrJMX2+w3+exJiC1v1gzWljZ/+/Mjymij9KHMcQF6kn5c4KGyfSu2d0migDSE
         Z+450h7Do91uL+SjwuxbdKA3gA5lYUmASHX5kQtmpJj08QaJCFs6de5xiys+lzIbMBSH
         cvirqANDXR0YcflLD8gMECiQJMRZIldv6CuiYjYuEr1WfoWY/g7fEzqnpqlMw73pqDjT
         Uga6Rvf39TtpI6KI3oxeZmeZosZGixiCWUEBvVL5VCYUrfDlexWkj35QuG38Hz7p8cAT
         1ruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790614707; x=1791219507;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o+2kKaVgsH8aYlHLbn2zMClqTNhp5rcXnKcP0njRaow=;
        b=AXIsGVPwAimssUMi8sxUAN39Cu8t8oMGV16Lx+X4/XOTFcI8HjN9YRDrh0ScpQSA9+
         E+xW5HjpBx8xv2xT/zSHNiQbkYeyo03HOweZ4l4U9lFIkziwA/niNzRyrlD55tpmqVgN
         LOZ+zwUFngY5PPe2xC7vKre6+702T/uQWmoMbTf+JVbLaNnpp9+gMlQjQ3gmNfDBktf+
         BgPCwr5lX+HxiTLO8h2Ts/XDpl5m/97PHONNKoBiL4Ckj3dLeqpTxsJxb4P48ivBEDwD
         fQ5/ugVinuek0dRDFYqAQVd0b5JWLo4ky2rznIcS2qMwaWkZwpyXis4FdX+pE72xjjsR
         7W/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxqcMOKcZL3PY1wQg1K1HWJuj4dBDtLhC6UlZ7KBV6jw3I1g2NkkITeeXduHLK4uNfdaNqw/S0=@lists.infradead.org
X-Gm-Message-State: AFuF++mf00Q3jKmdyAv1ho9EIsivVWy7t4vkbygTNWe6DNK/FUe6YTlT
	wF5BqnwOEpZaZyj1q0voSZhR6YET0ojdGiR1T6P/k0ko9hZ1wSM+PuGcgdT2JkXfAPYQR9p+epo
	Ldw+BezQy5pLq29HtSKvJD3BYfXjul2aCRmu3vWBg10DE+vh231ebyDO2xar+3voU
X-Gm-Gg: AYBFou0z3liw3910adpexEVDzj3aIKS3wf1krp+svs6gVFLLVgHfl2/IMCcv+fBqdNa
	u2S9tiEHTe1W+iFPlkg9t/eHunvD1PcHnZhMNPoekLRUkXk1EJvJYhkAmPXHNkVcyr3QLPzCeb4
	VGdrlIvjolBF5rrIIIFMz4NreRwfj24hzGMyEy36DNsRJSddngRPUYm3KsiUnsNANDJCWjOwL5g
	s4leARcEumvn8NV4xZU+8x0oEuE1qrP5nA+0PVTZNZbnOw+PkR21c0AFcqpRpzJQLOCh6nxAF8b
	DctmO1WaP6puV06vdNJh780GDjNvDVsb3VTCM+OLDVcRWGXQsR53E7gV0g+Eht9smHiwn+5PyKn
	69vVQL4EtaK5OYD2hdLbps3m7KJGowkhp5pB0eUd5KCw=
X-Received: by 2002:a05:701b:270c:b0:148:722b:7cbc with SMTP id a92af1059eb24-148723ac1a6mr7135633c88.14.1790614706514;
        Mon, 28 Sep 2026 09:58:26 -0700 (PDT)
X-Received: by 2002:a05:701b:270c:b0:148:722b:7cbc with SMTP id a92af1059eb24-148723ac1a6mr7135534c88.14.1790614704487;
        Mon, 28 Sep 2026 09:58:24 -0700 (PDT)
Received: from [192.168.11.104] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc47ab8sm30120394c88.6.2026.09.28.09.58.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 09:58:24 -0700 (PDT)
Message-ID: <02a86a9a-fdbb-432a-9fcf-09aade56b5dc@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 22:28:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath11k: fix unbalanced IRQ
 enable/disable during suspend/resume
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Julius Bairaktaris <julius@bairaktaris.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
References: <20260928-ath11k-unbalanced-irq-enable-disable-v1-1-75166f534763@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260928-ath11k-unbalanced-irq-enable-disable-v1-1-75166f534763@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GOwfB_XKItowQHe7XfhOzfxTNg7FunMg
X-Proofpoint-GUID: GOwfB_XKItowQHe7XfhOzfxTNg7FunMg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2NyBTYWx0ZWRfX5ULX2qWw/p8/
 ZiXPWk7ZN4Xnb6138Iy4a4fshyDFbwi7X/NtREZZgv3hJ4V3ioea1Pkahfy1W0T3SLZDdxbljim
 xkOaPPGHKFQBl3X67H83j59BJ9wFy2daw5ErRwUDk6baByHzd9rNWwHN0+ig9UnWnC5m/H10nUK
 XGDaOE0U4OGnx9BCPMbYg3bIPv2JLJXY+1mV5+EQMg0C2BfA468HSfcuwgJ5oU+rCKfTNMvb+0v
 zlRt5S2qEf21DzqfFViLtiLNukaNy6hUSKlRZHnPRMFPq6HtPJcTaJIH6YuBSqCvkG2apMxFNLf
 JZ+cXK72sfGm/BfgrCggSjlqOLgLFT90+Mwo6j6UiAIhDwCPKFCHm5EIhKb/d3pzxVpxeCDIVfu
 tcWW9Oxuev5PBeiVeh0xkwgiR3EZPb063s0JYVtlK+31Ei8UHTgeWxj7AsEJXGZ4Wjzs6fTCn7s
 FLFb9+ASCLJ9ReQs09g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2NyBTYWx0ZWRfXzqr/TWvqYmKT
 bqdBylS16rq6O4QlyEqM5taxVou9UZcRrCASo6X2DqMIi5BT0T4DaKTLNJpjjZB8qJbwJH4R+7g
 UI4JMjpwS42RB+PAJ/0SYGBIcdAF7sM=
X-Authority-Analysis: v=2.4 cv=asYnmiZV c=1 sm=1 tr=0 ts=6aba9cb3 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8 a=ZvQbaIHpGuiZngXRD0IA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_095828_848462_B4A82228 
X-CRM114-Status: GOOD (  13.85  )
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

On 9/28/2026 4:15 PM, Baochen Qiang wrote:
> Commit f7a74e131d3f ("wifi: ath11k: disable interrupts during firmware
> crash recovery") added an unconditional ath11k_hif_irq_disable()/
> ath11k_hif_ce_irq_disable() pair inside
> ath11k_core_reconfigure_on_crash(), guarded by "if (!ab->is_reset)", to
> stop the DP NAPI from touching rings that have just been torn down. That
> fixes AHB device recovery, but breaks PCI device suspend/resume. During
> suspend, IRQs are disabled once in ath11k_core_suspend_late(). Then during
> resume, ath11k_core_reconfigure_on_crash() sees ab->is_reset clear and
> disables them a second time. Those IRQs are enabled only once during
> the following reinitialization, leaving the IRQ lines masked. As a result,
> HTC control responses never arrive, and resume fails:
> 
>    failed to receive control response completion, polling..
>    failed to connect to HTT: -110
>    failed to reconfigure driver on crash recovery
>    failed to resume core: -110
> 
> Fix this by disabling the IRQs unconditionally at the top of
> ath11k_core_reconfigure_on_crash(), and instead drop the disable
> calls from the two places that already disable IRQs before this
> function can run: ath11k_core_suspend_late() and ath11k_core_reset().
> This keeps a single disable per recovery/suspend cycle regardless of
> which path (recovery or suspend) triggers it, so the refcount on
> PCI parts stays balanced while AHB parts keep getting the disable
> that the original commit needed.
> 
> Fixes: f7a74e131d3f ("wifi: ath11k: disable interrupts during firmware crash recovery")
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/linux-wireless/a068a857-a549-4cc2-ae0f-3ef119d3a859@samsung.com/
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Julius Bairaktaris <julius@bairaktaris.de>
> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

